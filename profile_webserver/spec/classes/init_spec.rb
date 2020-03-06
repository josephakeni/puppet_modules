require 'spec_helper'
describe 'profile_web' do
  context 'with default values for all parameters' do
    it { should contain_class('profile_web') }
  end
end
