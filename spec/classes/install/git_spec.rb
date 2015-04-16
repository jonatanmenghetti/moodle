require 'spec_helper'

describe 'git' do

  it { should contain_package('git').with_ensure('latest') }
  it { should contain_file('/var/www/html/moodle/README.txt') }
end
