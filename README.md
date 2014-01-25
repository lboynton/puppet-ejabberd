# Puppet Ejabberd Module
[![Build Status](https://travis-ci.org/lboynton/puppet-ejabberd.png?branch=master)](https://travis-ci.org/lboynton/puppet-ejabberd)

This is an ejabberd module for installing and configuring ejabberd. It has been tested on CentOS 6 with ejabberd 2.1.13.

## Usage
Use the defaults:

```puppet
include ejabberd
```

Or to configure:

```puppet
class { 'ejabberd':
    config_source   => 'puppet:///files/my/ejabberd.cfg',
    package_ensure  => 'installed',
    package_name    => 'ejabberd',
    service_reload  => true,
}
```

By default, when the config file changes the ACLs will be reloaded by running `ejabberdctl load_config`. For this to work, the mod_admin_extra module must be installed. To add new hosts, ejabberd must be restarted manually. Alternatively, you can tell the module to restart ejabberd instead of doing a reload by setting `service_reload => false`.

## Defines

### ejabberd::contrib::module

Installs a module from the contrib repository. Note that you will also need to add the module to your ejabberd.cfg config file to enable it.

```puppet
ejabberd::contrib::module { 'mod_rest': }
```

## Providers

### ejabberd_user

This provider can be used to create users:

```puppet
ejabberd_user { 'myusername':
    host        => 'localhost',
    password    => 'mypassword'
}
```

## License
Copyright 2014 Lee Boynton

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.


## Support
Please log tickets and issues on [GitHub](https://github.com/lboynton/puppet-ejabberd/issues)
