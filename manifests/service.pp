class ejabberd::service(
) inherits ejabberd::params {
    service { 'ejabberd':
        ensure     => running,
        enable     => true,

        # Requires mod_admin_extra module to be loaded. This only reloads ACLs.
        restart    => '/usr/bin/ejabberdctl load_config /etc/ejabberd/ejabberd.cfg',
    }
}