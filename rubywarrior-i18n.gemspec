# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ruby_warrior/version"

Gem::Specification.new do |s|
  s.name        = "rubywarrior-i18n"
  s.version     = RubyWarrior::VERSION
  s.authors     = ["Ryan Bates", "Rafael Magana"]
  s.email       = ["ryan@railscasts.com", "raf.magana@gmail.com"]
  s.homepage    = "https://github.com/rafmagana/ruby-warrior-i18n"
  s.summary     = "Multi-language game written in Ruby for learning Ruby and artificial intelligence."
  s.description = "You play as a warrior climbing a tall tower. On each floor you need to write a Ruby script to instruct the warrior to battle enemies, rescue captives, and reach the stairs."

  s.files        = Dir["{i18n,lib,spec,features,towers,templates,bin}/**/*", "[A-Z]*", "init.rb"]
  s.require_paths = ["lib"]
  s.executables  = ["rubywarrior"]

  s.rubyforge_project = s.name
  s.required_rubygems_version = ">= 1.3.4"

  s.add_dependency('r18n-desktop', '1.0.0')

  s.add_development_dependency('rake')
  s.add_development_dependency('rspec', '2.8.0')
  s.add_development_dependency('cucumber', '1.2.1')
  s.add_development_dependency('mocha', '0.11.4')
end
