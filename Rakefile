#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rake/testtask'


desc "Run tests"
Rake::TestTask.new('test') do |t|
  t.libs.push "lib"
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
end


task :default => :test