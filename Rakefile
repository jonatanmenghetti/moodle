require 'rake'
require 'rspec/core/rake_task'

desc "Run all RSpec code examples"
RSpec::Core::RakeTask.new(:rspec) do |t|
  t.rspec_opts = File.read("spec/spec.opts").chomp || ""
end

SPEC_SUITES = (Dir.entries('spec') - ['.', '..','fixtures']).select {|e| File.directory? "spec/#{e}" }
namespace :rspec do
  SPEC_SUITES.each do |suite|
    desc "Run #{suite} RSpec code examples"
    RSpec::Core::RakeTask.new(suite) do |t|
      t.pattern = "spec/#{suite}/**/*_spec.rb"
      t.rspec_opts = File.read("spec/spec.opts").chomp || ""
    end
  end
end
task :default => :rspec

# Need to work out why puppet-lint wants to say package is not in autoload layout
# and I can't get it to ignore that from rake.
#begin
#  if Gem::Specification::find_by_name('puppet-lint')
#    require 'puppet-lint/tasks/puppet-lint'
#    PuppetLint.configuration.send("disable_no-autoloader_layout")
#    PuppetLint.configuration.ignore_paths = ["spec/**/*.pp", "vendor/**/*.pp"]
#    task :default => [:rspec, :lint]
#  end
#rescue Gem::LoadError
#end