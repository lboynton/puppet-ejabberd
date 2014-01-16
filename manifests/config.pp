class ejabberd::config(
    $config_content = $ejabberd::params::config_content,
    $config_source  = $ejabberd::params::config_source
) inherits ejabberd::params {

    if ($config_source != undef) {
        File {
            source  => $config_source,
        }
    }
    else {
        File {
            content  => $config_content,
        }
    }

    file { '/etc/ejabberd/ejabberd.cfg':
        ensure  => present,
        owner   => 'ejabberd',
        group   => 'ejabberd',
        mode    => '0640',
    }
}