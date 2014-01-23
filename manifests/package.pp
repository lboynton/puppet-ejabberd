class ejabberd::package(
    $ensure         = $ejabberd::params::package_ensure,
    $package_name   = $ejabberd::params::package_name
) inherits ejabberd::params {
    case $::osfamily {
        'RedHat': {
            include epel
            Class['epel'] -> Package['ejabberd']
        }
    }
    package { 'ejabberd':
        ensure  => $ensure,
        name    => $package_name,
    }
}