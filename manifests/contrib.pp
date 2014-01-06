class ejabberd::contrib {
    if !defined(Package['git']) {
        package { 'git':
            ensure => installed,
        }
    }

    vcsrepo { '/usr/local/src/ejabberd-modules':
        ensure      => present,
        provider    => git,
        source      => 'https://github.com/processone/ejabberd-contrib.git',
        require     => Package['git'],
        revision    => '2.1.x',
    }
}