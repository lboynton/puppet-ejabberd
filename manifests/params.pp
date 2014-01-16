class ejabberd::params {
    $config         = template('ejabberd/ejabberd.cfg.erb')
    $package_ensure = installed
    $package_name   = 'ejabberd'
}