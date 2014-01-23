class ejabberd::service(
    $service_reload    = $ejabberd::params::service_reload,
) inherits ejabberd::params {

    if ($service_reload) {
        Service {
            # Requires mod_admin_extra module to be loaded. This only reloads ACLs.
            restart    => '/usr/bin/ejabberdctl load_config /etc/ejabberd/ejabberd.cfg',
        }
    }

    service { 'ejabberd':
        ensure     => running,
        enable     => true,
    }
}