class ejabberd::package(
    $ensure         = $ejabberd::params::package_ensure,
    $package_name   = $ejabberd::params::package_name,
    $include_epel   = $ejabberd::params::include_epel
) inherits ejabberd::params {
    case $::osfamily {
        'RedHat': {
            if $include_epel == true {
                include epel
                Class['epel'] -> Package['ejabberd']
            }
        }
        default: {
            # by default assume package is in system repos
        }
    }
    package { 'ejabberd':
        ensure  => $ensure,
        name    => $package_name,
    }
}
