require 'rubygems'
require 'rspec'
require File.dirname(__FILE__) + '/../lib/ruby_warrior'

R18n.default_places = './i18n/'
R18n.set('en')

RSpec.configure do |config|
  config.mock_with :mocha
  config.before(:each) do
    RubyWarrior::Config.reset
  end
end
