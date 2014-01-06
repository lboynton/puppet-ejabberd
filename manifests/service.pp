class ejabberd::service(
) inherits ejabberd::params {
    service { 'ejabberd':
        ensure     => running,
        enable     => true,
    }
}