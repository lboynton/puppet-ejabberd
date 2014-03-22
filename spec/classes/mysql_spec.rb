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

    context 'with hardwaremodel => x86_64' do
        let(:facts) { { :hardwaremodel => 'x86_64' } }

        it { should contain_file('/usr/lib64/ejabberd/ebin/mysql.beam') \
            .with_source('/usr/local/src/mysql/ebin/mysql.beam')
        }

        it { should contain_file('/usr/lib64/ejabberd/ebin/mysql_auth.beam') \
            .with_source('/usr/local/src/mysql/ebin/mysql_auth.beam')
        }

        it { should contain_file('/usr/lib64/ejabberd/ebin/mysql_conn.beam') \
            .with_source('/usr/local/src/mysql/ebin/mysql_conn.beam')
        }

        it { should contain_file('/usr/lib64/ejabberd/ebin/mysql_recv.beam') \
            .with_source('/usr/local/src/mysql/ebin/mysql_recv.beam')
        }
    end

    context 'with hardwaremodel => i686' do
        let(:facts) { { :hardwaremodel => 'i686' } }

        it { should contain_file('/usr/lib/ejabberd/ebin/mysql.beam') \
            .with_source('/usr/local/src/mysql/ebin/mysql.beam')
        }

        it { should contain_file('/usr/lib/ejabberd/ebin/mysql_auth.beam') \
            .with_source('/usr/local/src/mysql/ebin/mysql_auth.beam')
        }

        it { should contain_file('/usr/lib/ejabberd/ebin/mysql_conn.beam') \
            .with_source('/usr/local/src/mysql/ebin/mysql_conn.beam')
        }

        it { should contain_file('/usr/lib/ejabberd/ebin/mysql_recv.beam') \
            .with_source('/usr/local/src/mysql/ebin/mysql_recv.beam')
        }
    end
end