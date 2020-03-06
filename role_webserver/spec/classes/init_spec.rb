require 'spec_helper'
describe 'role_web' do
  context 'with default values for all parameters' do
    it { should contain_class('role_web') }
  end
end
