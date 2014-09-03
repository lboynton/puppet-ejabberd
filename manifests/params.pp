class ejabberd::params {
    $config_content     = template('ejabberd/ejabberd.cfg.erb')
    $config_source      = undef
    $package_ensure     = installed
    $package_name       = 'ejabberd'
    $service_reload     = true,
    $include_epel       = true
}
