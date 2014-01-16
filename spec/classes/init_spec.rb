require 'spec_helper'

describe 'ejabberd' do
    it { should contain_class('ejabberd::package') }
    it { should contain_class('ejabberd::config') }
    it { should contain_class('ejabberd::service') }
end