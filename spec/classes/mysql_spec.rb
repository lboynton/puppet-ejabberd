require 'spec_helper'

describe 'ejabberd::mysql' do
    it { should contain_package('git') \
        .with_ensure('installed')
    }
    it { should contain_package('erlang-rebar') \
        .with_ensure('installed')
    }
    it { should contain_vcsrepo('/usr/local/src/mysql') \
        .with_ensure('present') \
        .with_provider('git') \
        .with_source('https://github.com/processone/mysql.git') \
        .with_revision('967f3a0bb7')
    }
    it { should contain_exec('compile-mysql') }
end