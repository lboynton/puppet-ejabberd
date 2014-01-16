require 'spec_helper'

describe 'ejabberd::config' do

    context 'with default config' do
        let(:params) { {:config => "template('ejabberd/ejabberd.cfg.erb')" } }

        it { should contain_file('/etc/ejabberd/ejabberd.cfg') \
            .with_content("template('ejabberd/ejabberd.cfg.erb')")
        }
    end

end