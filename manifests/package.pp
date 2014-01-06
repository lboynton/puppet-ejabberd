class ejabberd::package(
    $ensure         = $ejabberd::params::package_ensure,
    $package_name   = $ejabberd::params::package_name
) inherits ejabberd::params {
    package { 'ejabberd':
        ensure  => $ensure,
        name    => $package_name,
    }
}