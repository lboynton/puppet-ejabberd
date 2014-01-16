require 'spec_helper'

describe 'ejabberd::service' do
    it { should contain_service('ejabberd') \
        .with_ensure('running') \
        .with_enable('true')
    }
end