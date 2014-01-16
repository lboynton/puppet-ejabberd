class ejabberd::config(
    $config = $ejabberd::params::config
) {
    file { '/etc/ejabberd/ejabberd.cfg':
        ensure  => present,
        owner   => 'ejabberd',
        group   => 'ejabberd',
        mode    => '0640',
        content => $config,
        notify  => Exec['reload-config'],
    }

    # Requires mod_admin_extra module to be loaded. This only reloads ACLs.
    exec { 'reload-config':
        command     => '/usr/bin/ejabberdctl load_config /etc/ejabberd/ejabberd.cfg',
        refreshonly => true,
    }
}