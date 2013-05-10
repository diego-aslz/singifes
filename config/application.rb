require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record"
require 'bundler/setup'
require 'active_support/dependencies'

def do_require(f)
  if f =~ /example/
    @logger.debug "Ignoring #{f}, cause it's an example..."
    return
  end
  @logger.debug "Requiring #{f}..."
  require f
end

project_root = File.dirname(File.absolute_path(__FILE__)) + '/..'

ENV['ENV'] ||= 'production'
database_cfg = YAML.load(ERB.new(IO.read(File.join(project_root, 'config',
    "database.yml"))).result)
connection_details = database_cfg[ENV['ENV']] rescue nil || {}

["lib", "config/initializers"].each do |dir|
  Dir["#{project_root}/#{dir}/*.rb"].each {|f| do_require f }
end
["app/models/remote/concerns", "app"].each do |dir|
  Dir["#{project_root}/#{dir}/**/*.rb"].each {|f| do_require f }
end

ActiveRecord::Base.establish_connection(connection_details)
