class ejabberd::config {
    file { '/etc/ejabberd/ejabberd.cfg':
        ensure  => present,
        owner   => 'ejabberd',
        group   => 'ejabberd',
        mode    => '0640',
        content => template('ejabberd/ejabberd.cfg.erb'),
    }
}