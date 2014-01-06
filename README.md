Puppet Ejabberd Module
=======

This is an ejabberd module for installing and configuring ejabberd. It has been tested on CentOS 6.

Usage
-------

```puppet
include ejabberd
```

To create users:

```puppet
ejabberd_user { 'myusername':
    host        => 'localhost',
    password    => 'mypassword'
}
```

License
-------


Contact
-------


Support
-------

Please log tickets and issues on [GitHub](https://github.com/lboynton/puppet-ejabberd/issues)
