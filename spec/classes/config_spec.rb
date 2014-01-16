require 'spec_helper'

describe 'ejabberd::config' do

    context 'with default config' do
        let(:params) { {:config_content => "template('ejabberd/ejabberd.cfg.erb')" } }

        it { should contain_file('/etc/ejabberd/ejabberd.cfg') \
            .with_content("template('ejabberd/ejabberd.cfg.erb')") \
            .without_source
        }
    end

    context 'with config_source => puppet:///file' do
        let(:params) { {:config_source => 'puppet:///file' } }

        it { should contain_file('/etc/ejabberd/ejabberd.cfg') \
            .with_source('puppet:///file') \
            .without_content
        }
    end

end