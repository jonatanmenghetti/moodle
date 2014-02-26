require 'spec_helper'

describe 'Moodle' do
  let(:title) {'git'}
  it { should contain_package('git')}

end
