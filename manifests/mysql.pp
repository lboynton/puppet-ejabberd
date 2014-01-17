# Installs the native erlang mysql driver
class ejabberd::mysql {
    if !defined(Package['git']) {
        package { 'git':
            ensure => installed,
        }
    }
    if !defined(Package['erlang-rebar']) {
        package { 'erlang-rebar':
            ensure => installed,
        }
    }

    vcsrepo { '/usr/local/src/mysql':
        ensure      => present,
        provider    => git,
        source      => 'https://github.com/processone/mysql.git',
        require     => Package['git'],

        # use first version which is compatible with ejabberd 2.1.x
        revision    => '967f3a0bb7',
    }

    exec { 'compile-mysql':
        command => '/usr/bin/rebar compile',
        creates => '/usr/local/src/mysql/ebin/mysql.beam',
        cwd     => '/usr/local/src/mysql',
        require => [
            Package['erlang-rebar'],
            Vcsrepo['/usr/local/src/mysql'],
        ]
    }

    file { '/usr/lib64/ejabberd/ebin/mysql.beam':
        ensure  => present,
        source  => '/usr/local/src/mysql/ebin/mysql.beam',
        require => Exec['compile-mysql'],
    }
    file { '/usr/lib64/ejabberd/ebin/mysql_auth.beam':
        ensure  => present,
        source  => '/usr/local/src/mysql/ebin/mysql_auth.beam',
        require => Exec['compile-mysql'],
    }
    file { '/usr/lib64/ejabberd/ebin/mysql_conn.beam':
        ensure  => present,
        source  => '/usr/local/src/mysql/ebin/mysql_conn.beam',
        require => Exec['compile-mysql'],
    }
    file { '/usr/lib64/ejabberd/ebin/mysql_recv.beam':
        ensure  => present,
        source  => '/usr/local/src/mysql/ebin/mysql_recv.beam',
        require => Exec['compile-mysql'],
    }
}