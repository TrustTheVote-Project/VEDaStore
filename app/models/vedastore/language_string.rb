class Vedastore::LanguageString < ActiveRecord::Base
  include XsdRailsFunctions
  
  belongs_to :internationalized_text
  include Vedaspace::LanguageString
  
end
