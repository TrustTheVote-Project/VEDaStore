class Vedastore::InternationalizedText < ActiveRecord::Base
  include XsdRailsFunctions
  
  has_many :language_strings
  include Vedaspace::InternationalizedText
  
end
