require 'spec_helper'
describe 'profile_app' do
  context 'with default values for all parameters' do
    it { should contain_class('profile_app') }
  end
end
