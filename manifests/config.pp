class ejabberd::config {
    file { '/etc/ejabberd/ejabberd.cfg':
        ensure  => present,
        owner   => 'ejabberd',
        group   => 'ejabberd',
        mode    => '0640',
        content => template('ejabberd/ejabberd.cfg.erb'),
        notify  => Exec['reload-config'],
    }

    # Requires mod_admin_extra module to be loaded. This only reloads ACLs.
    exec { 'reload-config':
        command     => '/usr/bin/ejabberdctl load_config /etc/ejabberd/ejabberd.cfg',
        refreshonly => true,
    }
}