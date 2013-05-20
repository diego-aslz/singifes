ENV["ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec'
# require 'factory_girl'

Dir[File.expand_path("../support/**/*.rb", __FILE__)].each {|f| require f}

RSpec.configure do |config|
  config.order = "random"

  # config.include FactoryGirl::Syntax::Methods

  config.before(:each) { GC.disable }
  config.after(:each) { GC.enable }
end
