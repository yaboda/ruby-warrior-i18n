require 'cucumber'
require 'rspec'

require File.dirname(__FILE__) + '/../../lib/ruby_warrior'

R18n.default_places = './i18n/'
R18n.set('en')

Before do
  RubyWarrior::Config.reset
end

After do
  FileUtils.rm_rf "towers/short"
end
