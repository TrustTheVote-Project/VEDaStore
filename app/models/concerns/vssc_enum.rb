module VsscEnum
  module ClassMethods
    def all
      self.enums
    end
    
    def find(string_val)
      enums.detect {|e| e.to_s.downcase == string_val.to_s.downcase}
    end
  
    def enums
      @enums ||= []
      @enums
    end
    
    def values
      enums.collect(&:to_s)
    end
    
    def set_enum_values(*args)
      @enums = []
      args.each do |val|
        inst = self.new(val)
        @enums << inst
        @enums << val
        self.class.instance_eval do
          define_method(val.gsub('-','_')) { inst }
        end
      end
    end
  end
  
  def self.included(base)
    base.extend ClassMethods
  end
  
  attr_reader :value

  def to_s
    value
  end

  def initialize(val)
    @value = val
  end
  
end