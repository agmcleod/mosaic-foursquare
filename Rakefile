require 'rubygems'
require 'rake'
require 'rspec/core/rake_task'
require 'bundler'

Bundler::GemHelper.install_tasks

if RUBY_VERSION < '1.9.3'
  require 'rcov/rcovtask'
  desc 'Run all specs with rcov in spec directory'
  RSpec::Core::RakeTask.new(:rcov) do |t|
    t.rcov = true
    t.rcov_opts = "--output coverage/rcov --exclude '^(?!lib)'"
  end

  desc 'Default: run specs under rcov'
  task :default => :rcov
else
  desc "Run RSpec"
  RSpec::Core::RakeTask.new(:spec)

  desc 'Default: run specs.'
  task :default => [:spec]
end
