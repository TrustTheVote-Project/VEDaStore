module Vedastore
  class Engine < ::Rails::Engine
    isolate_namespace Vedastore
    
    config.generators do |g|
      g.test_framework      :rspec,        :fixture => false
      g.assets false
      g.helper false
    end
    
  end
end
