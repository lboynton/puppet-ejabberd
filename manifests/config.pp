class ejabberd::config(
    $config = $ejabberd::params::config
) {
    file { '/etc/ejabberd/ejabberd.cfg':
        ensure  => present,
        owner   => 'ejabberd',
        group   => 'ejabberd',
        mode    => '0640',
        content => $config,
    }
}