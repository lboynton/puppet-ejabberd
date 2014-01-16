# == Class: ejabberd
#
# Full description of class ejabberd here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { ejabberd:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Lee Boynton <lee@lboynton.com>
#
# === Copyright
#
# Copyright 2014 Lee Boynton, unless otherwise noted.
#
class ejabberd(
    $config         = $ejabberd::params::config,
    $package_ensure = installed,
    $package_name   = 'ejabberd'
) inherits ejabberd::params {
    class { '::ejabberd::package':
        ensure          => $package_ensure,
        package_name    => $package_name
    } ->
    class { '::ejabberd::config':
        config => $config
    } ->
    class { '::ejabberd::service': }
}
