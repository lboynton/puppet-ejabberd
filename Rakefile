require 'rubygems'
require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'

PuppetLint.configuration.send("disable_class_inherits_from_params_class")
PuppetLint.configuration.ignore_paths = ["modules/**/*.pp"]

# replace spec_standalone task from puppetlabs_spec_helper so that we can use spec.opts file
Rake::Task["spec_standalone"].clear

desc "Run spec tests on an existing fixtures directory"
RSpec::Core::RakeTask.new(:spec_standalone) do |t|
  t.rspec_opts = File.read("spec/spec.opts").chomp || ""
  t.pattern = 'spec/{classes,defines,unit,functions,hosts,integration}/**/*_spec.rb'
end