require "vedastore/engine"
require 'vedaspace'
module Vedastore
  # Vedaspace::ElectionReport.concrete_class_name = 'Vedastore::ElectionReport'
  # Vedaspace::Election.concrete_class_name = 'Vedastore::Election'
  # Vedaspace::BallotStyle.concrete_class_name = 'Vedastore::BallotStyle'
  
  file_name_match  = /^.+\/(?<file_name>[^\/]+).rb$/
  Dir[File.dirname(__FILE__).gsub('lib', 'app/models/vedastore/*.rb')].each do |file| 
    if fn = file_name_match.match(file)[:file_name]
      class_name = fn.classify
      puts class_name
      mod = "Vedaspace::#{class_name}".constantize
    end
    
  end
  
  
end
