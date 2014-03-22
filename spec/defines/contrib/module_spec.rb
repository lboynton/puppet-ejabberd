require 'spec_helper'

describe 'ejabberd::contrib::module' do

    context 'with hardwaremodel => x86_64 and title => mod_rest' do
        let(:facts) { { :hardwaremodel => 'x86_64' } }
        let(:title) { 'mod_rest' }

        it { should contain_exec('compile-mod_rest') \
            .with_cwd('/usr/local/src/ejabberd-modules/mod_rest/') \
            .with_command('/usr/local/src/ejabberd-modules/mod_rest/build.sh') \
            .with_creates('/usr/local/src/ejabberd-modules/mod_rest/ebin/mod_rest.beam')
        }

        it { should contain_file('/usr/lib64/ejabberd/ebin/mod_rest.beam') \
            .with_source('/usr/local/src/ejabberd-modules/mod_rest/ebin/mod_rest.beam')
        }
    end

    context 'with hardwaremodel => i686 and title => mod_admin_extra' do
        let(:facts) { { :hardwaremodel => 'i686' } }
        let(:title) { 'mod_admin_extra' }

        it { should contain_exec('compile-mod_admin_extra') \
            .with_cwd('/usr/local/src/ejabberd-modules/mod_admin_extra/') \
            .with_command('/usr/local/src/ejabberd-modules/mod_admin_extra/build.sh') \
            .with_creates('/usr/local/src/ejabberd-modules/mod_admin_extra/ebin/mod_admin_extra.beam')
        }

        it { should contain_file('/usr/lib/ejabberd/ebin/mod_admin_extra.beam') \
            .with_source('/usr/local/src/ejabberd-modules/mod_admin_extra/ebin/mod_admin_extra.beam')
        }
    end

end
