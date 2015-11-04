require "vedastore/engine"
require 'vedaspace'
module Vedastore
  file_name_match  = /^.+\/(?<file_name>[^\/]+).rb$/
  Dir[File.dirname(__FILE__).gsub('lib', 'app/models/vedastore/*.rb')].each do |file| 
    if fn = file_name_match.match(file)[:file_name]
      class_name = fn.classify
      mod = "Vedaspace::#{class_name}".constantize
      mod.send(:concrete_class_name=, "Vedastore::#{class_name}")
    end
    
  end
  
  
end
