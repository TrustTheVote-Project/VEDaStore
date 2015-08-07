module VsscFunctions
	extend ActiveSupport::Concern
  
  included do
    #class_attribute :elements, :xml_attributes, {instance_accessor: false}
    class << self
      attr_accessor :elements, :xml_attributes, :text_node_method
    end
  end
  
  module ClassMethods
  
    def define_xml_accessor(accessor_group, element_name, opts={})
      
      method_name = opts[:method] || element_name.underscore      
      
      self.send("#{accessor_group}=", (self.send(accessor_group) || {}))
    
      self.send(accessor_group)[element_name] ||= {}
      self.send(accessor_group)[element_name][:method] = method_name.to_sym
      element_type = opts[:type] || String
      self.send(accessor_group)[element_name][:type] = element_type
      # this is for those "collections"
      self.send(accessor_group)[element_name][:passthrough] = opts[:passthrough]
      
      if opts[:belongs_to]
        belongs_to method_name.to_sym, class_name: element_type.to_s 
      end
      
    end
  
    def define_element(element_name, opts={})
      define_xml_accessor(:elements, element_name, opts)
    end
    
    def define_attribute(element_name, opts={})
      define_xml_accessor(:xml_attributes, element_name, opts)
    end
    
    def define_text_node(method_name)
      self.text_node_method = method_name
    end
    
    def noko_doc(file_contents_or_path)
      doc = nil
      begin
        doc = Nokogiri::XML(file_contents_or_path) { |config| config.noblanks }
        if doc.elements.empty?
          doc = Nokogiri::XML(open(file_contents_or_path)) { |config| config.noblanks }
        end
      rescue
        doc = Nokogiri::XML(open(file_contents_or_path)) { |config| config.noblanks }
      end
      doc  
    end
    
    def parse_vssc_file(file_contents_or_path)
      node = self.noko_doc(file_contents_or_path).root
      er = self.parse_vssc(node)
      
      #er.save!
        
      return er
    end
    
    def parse_vssc(node)
      e = self.new
      e.set_vssc_attributes(node.attributes)
      e.set_vssc_elements(node.elements)
      e.set_text_node(node)
      e
    end
    
    def is_type?(type_name)
      begin
        "Vssc::#{type_name}".constantize
        return true
      rescue Exception, LoadError
        return false
      end
    end
    
  end
    
  def is_valid_date_time?(value)
    begin
      return DateTime.iso8601(value.to_s).iso8601.to_s == value.to_s
    rescue
      return false
    end
  end

  def xml_attributes
    return ([Object, ActiveRecord::Base].include?(self.class.superclass) ? {} : (self.class.superclass.xml_attributes || {})).merge(self.class.xml_attributes || {})
  end
  
  def xml_attributes_hash(node_name)
    attr_hash = {}
    self.xml_attributes.map do |k, options|
      v = convert_type_to_value(self.send(options[:method]), options[:type])
      attr_hash[k] = v unless v.nil?
    end
    if node_name != class_node_name && is_type?(node_name)
      attr_hash['xsi:type'] = class_node_name
    end
    return attr_hash
  end
  
  def is_type?(type_name)
    self.class.is_type?(type_name)
  end
  
  
  
  def elements
    ([Object, ActiveRecord::Base].include?(self.class.superclass) ? {} :( self.class.superclass.elements || {})).merge(self.class.elements || {})
  end
  
  
  def set_vssc_attributes(set_xml_attributes)
    set_xml_attributes.each do |key, value|
      if self.xml_attributes.include?(key)
        self.send("#{xml_attributes[key][:method]}=", convert_value_to_type(value.value, xml_attributes[key][:type] ))
      elsif key.to_s != 'type'
        parse_error "Attribute #{key} not part of #{self.class}"
      end
    end
  end
  
  def set_text_node(node)
    if self.class.text_node_method
      self.send("#{self.class.text_node_method}=", node.text)
    end
  end
  
  def is_many?(method)
    reflection = self.class.reflect_on_association(method)
    return reflection && [:has_many, :has_and_belongs_to_many].include?(reflection.macro)
  end
  
  def set_vssc_element_value(element, element_name, method, type)
    begin
      value =  convert_element_to_type(element, element_name, type)
      if is_many?(method)
        self.send("#{method}") << value
      else
        self.send("#{method}=", value)
      end
    rescue Exception => e
      puts "Error Parsing Element #{value}"
      raise e
    end
  end
  
  def set_vssc_elements(xml_elements)
    xml_elements.each do |element|
      if self.elements && self.elements.include?(element.name)
        method = elements[element.name][:method]
        type = elements[element.name][:type]
        if elements[element.name][:passthrough]
          element.elements.each do |pass_through_element|
            set_vssc_element_value(pass_through_element, element.name, method, type)
          end
        else
          set_vssc_element_value(element, element.name, method, type)
        end
      else
        parse_error "Element #{element.name} not part of #{self.class}"
      end
    end
  end
  
  def convert_element_to_type(element, element_name, obj_type)
    if obj_type.to_s == "String"
      element.children.first.to_s
    else
      klass = nil
      begin
        klass = self.class.reflect_on_association(self.elements[element_name][:method]).klass
        specific_type = nil
        if element.attributes && element.attributes["type"]
          specific_type = element.attributes["type"].value
        elsif element.attributes && element.attributes["xsi:type"]
          specific_type = element.attributes["xsi:type"].value
        end
        if specific_type
          klass = "Vssc::#{specific_type}".constantize
        # klass = "Vssc::#{(element.xml_attributes['type'].value || element.xml_attributes['xsi:type'].value || element_name)}".constantize
        end
      rescue Exception => e
        puts "Didn't parse element: #{self.class} - #{element_name} - #{element} - #{e.backtrace.join("\n")}"
        klass = obj_type
        klass = klass.constantize if klass.is_a?(String)
      end
      begin
        klass.parse_vssc(element)
      rescue Exception => e
        puts "Error in convert_element_to_type for class: #{klass}"
        raise e 
      end
    end
  end
  
  def convert_value_to_type(value, obj_type)
    return value
    # TODO: Figure out enums
    # if obj_type.is_a?(Class) && obj_type.ancestors.include?(VsscEnum)
    #   return obj_type.find(value)
    # end
    case obj_type.to_s
    when "String"
      return value.to_s
    when "Fixnum"
      return value.blank? ? nil : value.to_i
    when "Float"
      return value.blank? ? nil : value.to_f
    when "xsd:date", "xsd:dateTime"
      return value.blank? ? nil : DateTime.iso8601(value)
    when "xsd:boolean"
      return (!value.blank? && !["0","false","nil","null"].include?(value.to_s.downcase))
    else
      return value.to_s
    end
  end
  
  def convert_type_to_value(value, obj_type)
    case obj_type.to_s
    when "xsd:date"
      return value.blank? ? nil : value.iso8601.gsub(/T.*/,'')
    when "xsd:dateTime"
      return value.blank? ? nil : value.iso8601.gsub("+00:00","Z")
    when "xsd:boolean"
      return value.nil? ? nil : value.to_s
    when "Float"
      return value.blank? ? nil : value.to_s.chomp('.0')
    else
      return (value.to_s == "") ? nil : value.to_s
    end
  end
  
  def parse_error(msg)
    puts "Error: #{msg}"
  end
  
  def class_node_name
    self.class.name.split('::').last
  end
  
  def element_xml_node(r, k, options, value)
    node_name = k
    if options[:passthrough]
      node_name = options[:passthrough]
    end
    if !value.nil? && (!is_many?(options[:method]) || !value.empty?)       
      if options[:type].to_s =~ /Vssc::/
        if !is_many?(options[:method])
          value = [value]
        end
        value.each do |v|
          begin
            v.to_xml_node(r, node_name)
          rescue Exception => e
            puts "Error parsing node #{node_name} with value #{v.inspect}"
            Rails.logger.error("#{node_name} #{v.inspect}")
            raise e
          end
        end
      else
        if !is_many?(options[:method])
          value = [value]
        end
        value.each do |v|
          r.send(node_name, convert_type_to_value(v, options[:type]))
        end
      end
    end
  end
  
  def to_xml_node(xml = nil, node_name = nil, &block)
    node_name ||= class_node_name
    xml ||= Nokogiri::XML::Builder.new
    #Rails.logger.debug("Writing node: #{node_name}")
    if node_name == "BallotSelection"
      Rails.logger.debug("Writing node: #{node_name}")
    end
      
    xml.send(node_name, xml_attributes_hash(node_name)) do |r|
      elements.each do |k, options|
        value = self.send(options[:method])
        if options[:passthrough] && k != options[:passthrough]
          if value.any? #passthroughs are always for collections/multiples
            xml.send(k) do |pr|            
              self.element_xml_node(pr, k, options, value)
            end
          end
        else 
          self.element_xml_node(r, k, options, value)
        end
      end
      if block
        yield r
      end
    end
    return xml
  end
  
end