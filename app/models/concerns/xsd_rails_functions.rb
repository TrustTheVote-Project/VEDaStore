module XsdRailsFunctions
  extend ActiveSupport::Concern
  
  included do
    before_save :vedastore_before_save_callback
    after_save  :vedastore_after_save_callback
    
  end
  
  module ClassMethods
    def define_xml_accessor_hook(accessor_group, element_name, method_name, element_type, opts)
      # Element type is going to be a *Vedaspace* module. Lets look up which
      # class implements that module.
      # puts "hook " + element_type.to_s + element_type.implementing_classes.to_s
      if opts[:belongs_to]
        class_name = ''
        if element_type.is_a?(Class)
          class_name = element_type.to_s
        else 
          class_name = element_type.concrete_class_name
        end
        belongs_to method_name.to_sym, class_name: class_name, foreign_key: "#{method_name}_id".to_sym
      end
    end
  end
  
  def vedastore_before_save_callback
    #puts "Saving: #{self.class}"
  end
  
  def vedastore_after_save_callback
    #puts "Saved! #{self.class}"
  end
  
  
end