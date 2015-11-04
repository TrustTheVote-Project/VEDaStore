class Vedastore::AnnotatedString < ActiveRecord::Base
  include XsdRailsFunctions
  include Vedaspace::AnnotatedString
end
