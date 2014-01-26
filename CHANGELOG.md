# Changelog

## 0.0.3 2014-01-26
- ejabberd is now installed from epel on RedHat
- Added missing vcsrepo dep to modulefile
- Added service_reload parameter to configure module to either reload or restart ejabberd when config changes

## 0.0.2 2014-01-20
- Calls ejabberdctl load_config to reload ACLs when config changes. This means that ejabberd is no longer restarted when config changes.
- Allow ejabberd config file to be specified
- Allow package name and package ensure to be specified
- Some specs added
- Native erlang MySQL driver added

## 0.0.1 2014-01-10
- Initial release
