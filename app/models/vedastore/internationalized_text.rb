class Vedastore::InternationalizedText < ActiveRecord::Base
  include XsdRailsFunctions
  include Vedaspace::InternationalizedText
  
  has_many :language_strings
  
end
