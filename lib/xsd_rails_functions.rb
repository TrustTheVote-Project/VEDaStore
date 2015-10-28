module XsdRailsFunctions
  extend ActiveSupport::Concern
  
  included do
    before_save :vssc_before_save_callback
    after_save  :vssc_after_save_callback      
  end
  
  module ClassMethods
    def define_xml_accessor_hook(accessor_group, element_name, opts={})
      raise 'a'
      if opts[:belongs_to]
        belongs_to method_name.to_sym, class_name: element_type.to_s, foreign_key: "#{method_name}_id".to_sym
      end
    end
  end
  
  def vssc_before_save_callback
    #puts "Saving: #{self.class}"
  end
  
  def vssc_after_save_callback
    #puts "Saved! #{self.class}"
  end
  
  
end