require 'cucumber'
require 'rspec'
require 'bundler/setup'
Bundler.setup
require 'r18n-core'

R18n.default_places = './i18n/'
R18n.set('en')

require File.dirname(__FILE__) + '/../../lib/ruby_warrior'

Before do
  RubyWarrior::Config.reset
end

After do
  FileUtils.rm_rf "towers/short"
end
