# encoding: utf-8

require 'rubygems' unless defined?(Gem)
require 'rake' unless defined?(Rake)

# Prefer compiled Rubinius bytecode in .rbx/
ENV["RBXOPT"] = "-Xrbc.db"

require 'rake/extensiontask'
require 'rake/testtask'
require 'rdoc/task'

gemspec = eval(IO.read('mosquitto.gemspec'))

Gem::PackageTask.new(gemspec) do |pkg|
end

Rake::ExtensionTask.new('mosquitto', gemspec) do |ext|
  ext.name = 'mosquitto_ext'
  ext.ext_dir = 'ext/mosquitto'
  CLEAN.include 'lib/**/mosquitto_ext.*'
end

desc 'Run mosquitto tests'
Rake::TestTask.new(:test) do |t|
  t.test_files = Dir.glob("test/**/test_*.rb")
  t.verbose = true
  t.warning = true
end

namespace :debug do
  desc "Run the test suite under gdb"
  task :gdb do
    system "gdb --args ruby rake"
  end
end

desc 'Clobber Rubinius .rbc files'
task :clobber_rbc do
  sh 'find . -name *.rbc -print0 | xargs -0 rm'
end

task :test => :compile
task :default => :test