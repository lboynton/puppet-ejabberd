require 'spec_helper'

describe 'ejabberd::contrib' do
    it { should contain_package('git') \
        .with_ensure('installed')
    }
    it { should contain_vcsrepo('/usr/local/src/ejabberd-modules') \
        .with_ensure('present') \
        .with_provider('git') \
        .with_source('https://github.com/processone/ejabberd-contrib.git') \
        .with_revision('2.1.x')
    }
end