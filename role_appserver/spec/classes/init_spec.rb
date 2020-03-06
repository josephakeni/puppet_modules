require 'spec_helper'
describe 'role_app' do
  context 'with default values for all parameters' do
    it { should contain_class('role_app') }
  end
end
