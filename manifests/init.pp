# == Class: roundcube
#
# Install and manage the RoundCube webmailer
#
class roundcube (
  $confdir                   = $roundcube::params::confdir,
  $roundcube_webserver       = $roundcube::params::roundcube_webserver,
  $force_https               = $roundcube::params::force_https,
  $database_backend          = $roundcube::params::database_backend,
  $database_host             = $roundcube::params::database_host,
  $database_port             = $roundcube::params::database_port,
  $database_name             = $roundcube::params::database_name,
  $database_username         = $roundcube::params::database_username,
  $database_password         = $roundcube::params::database_password,
  $database_ssl              = $roundcube::params::database_ssl,
  $main_inc_php_erb          = $roundcube::params::main_inc_php_erb,
) inherits roundcube::params {

  contain ::roundcube::dbconfig
  contain ::roundcube::install
  contain ::roundcube::config

  Class[::roundcube::dbconfig] ->
  Class[::roundcube::install] ->
  Class[::roundcube::config]

}
