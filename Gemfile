#source :rubygems
source 'https://rubygems.org'

if ENV.key?('PUPPET_VERSION')
  puppetversion = "= #{ENV['PUPPET_VERSION']}"
else
  puppetversion = ['>= 3.4']
end

gem 'rake'
gem 'puppet-lint'
gem 'rspec-puppet'
gem 'puppet', puppetversion
gem 'coveralls', require: false
gem 'rspec'
gem 'puppet-syntax'
gem 'puppetlabs_spec_helper'
