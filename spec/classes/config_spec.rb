require 'spec_helper'

describe 'ejabberd::config' do

    it { should contain_file('/etc/ejabberd/ejabberd.cfg') }
    it { should contain_exec('reload-config') }

end