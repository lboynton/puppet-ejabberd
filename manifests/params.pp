class ejabberd::params {
    $config_content     = template('ejabberd/ejabberd.cfg.erb')
    $config_source      = undef
    $package_ensure     = installed
    $package_name       = 'ejabberd'
    $service_reload     = true

    case $::hardwaremodel {
        x86_64: {
            $lib_dir = '/usr/lib64/ejabberd'
        }
        default: {
            $lib_dir = '/usr/lib/ejabberd'
        }
    }
}