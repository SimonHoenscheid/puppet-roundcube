# == Class: roundcube
#
# Install and manage the RoundCube webmailer
#
class roundcube (
  $confdir                   = $roundcube::params::confdir,
  $database_backend          = $roundcube::params::database_backend,
  $database_host             = $roundcube::params::database_host,
  $database_port             = $roundcube::params::database_port,
  $database_name             = $roundcube::params::database_name,
  $database_username         = $roundcube::params::database_username,
  $database_password         = $roundcube::params::database_password,
  $database_ssl              = $roundcube::params::database_ssl,
  $manage_apache_config      = true,
  $main_inc_php_erb          = $roundcube::params::main_inc_php_erb,
  $log_logins                = false,
  $default_host              = 'localhost',
  $imap_auth_type            = 'PLAIN',
  $smtp_server               = 'localhost',
  $smtp_port                 = 25,
  $smtp_user                 = '%u',
  $smtp_pass                 = '%p',
  $smtp_auth_type            = 'PLAIN',
  $force_https               = false,
  $des_key                   = 'rcmail-!24ByteDESkey*Str',
  $plugins                   = [],
  $skin                      = 'larry',
  $timezone                  = 'auto',
  $identities_level          = 0,
) inherits roundcube::params {

  validate_absolute_path($confdir)
  validate_array($plugins)

  contain ::roundcube::dbconfig
  contain ::roundcube::install
  contain ::roundcube::config

  if $manage_apache_config {
    contain ::roundcube::apache
  }

  Class[::roundcube::dbconfig] ->
  Class[::roundcube::install] ->
  Class[::roundcube::config]

}
