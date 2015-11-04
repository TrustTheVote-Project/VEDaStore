class Vedastore::LanguageString < ActiveRecord::Base
  include XsdRailsFunctions
  include Vedaspace::LanguageString
  
  belongs_to :internationalized_text
  
end
