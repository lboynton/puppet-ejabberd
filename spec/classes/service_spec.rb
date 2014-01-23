require 'spec_helper'

describe 'ejabberd::service' do
    context 'with service_restart => true' do
        let(:params) { {:service_reload => true} }

        it { should contain_service('ejabberd') \
            .with_ensure('running') \
            .with_enable('true') \
            .with_restart('/usr/bin/ejabberdctl load_config /etc/ejabberd/ejabberd.cfg')
        }
    end

    context 'with service_restart => false' do
        let(:params) { {:service_reload => false} }

        it { should contain_service('ejabberd') \
            .with_ensure('running') \
            .with_enable('true') \
            .without_restart()
        }
    end

end