require 'bundler'

Bundler.require

require File.join(File.dirname(__FILE__), 'lib', 'boris')
require 'rspec'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = %w<-c>
  t.pattern = 'spec/*_spec.rb'
end

spec = eval(File.read('boris.gemspec'))

task :default => :spec
