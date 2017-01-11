# == Class: roundcube::params
#
# Default parameters for roundcube
#
class roundcube::params {
  #database params
  $confdir                    = '/etc/roundcube'
  $database_host              = $::fqdn
  $database_port              = undef
  $database_name              = 'roundcube'
  $database_username          = 'roundcube'
  $database_password          = 'roundcube'
  $database_ssl               = false
  $postgres_listen_addresses  = $::fqdn
  $database_backend           = 'mysql'
  $roundcube_webserver        = 'apache'
  $ip_mask_allow_all_users    = '0.0.0.0/0'

  #webserver params
  $config_inc_php_erb         = 'roundcube/config.inc.php.erb'
  $default_vhost_on           = true
  $default_mods               = false
  $default_confd_files        = false
  $mpm_module                 = 'prefork'
  $force_https                = false
  $servername                 = $::fqdn
  $serveraliases              = []
  $documentroot               = '/var/lib/roundcube'
  $purge_configs              = true
  # lint:ignore:strict_indent
  $scriptaliases              = [ { alias          => '/program/js/tiny_mce/',
                                    path           => '/usr/share/tinymce/www/' } ]
  $apache_port                = '80'
  $addhandlers                = []
  $ssl                        = false
  $ssl_ca                     = undef
  $ssl_cert                   = undef
  $ssl_key                    = undef
  $redirect_to_ssl            = false
  $suphp_user                 = 'roundcube'
  $suphp_group                = 'roundcube'
  $rewrites                   = undef
  $directories                = [ { path           => $documentroot,
                                    options        => '+FollowSymLinks',
                                    allow_override => 'All',
                                    order          => 'allow,deny',
                                    allow          => 'from all' },
                                  { path           => "${documentroot}/config",
                                    options        => '-FollowSymLinks',
                                    allow_override => 'None' },
                                  { path           => "${documentroot}/temp",
                                    options        => '-FollowSymLinks',
                                    allow_override => 'None',
                                    order          => 'allow,deny',
                                    deny           => 'from all' },
                                  { path           => "${documentroot}/logs",
                                    options        => '-FollowSymLinks',
                                    allow_override => 'None',
                                    order          => 'allow,deny',
                                    deny           => 'from all' },
                                  { path           => '/usr/share/tinymce/www/',
                                    options        => 'Indexes MultiViews FollowSymLinks',
                                    allow_override => 'None',
                                    order          => 'allow,deny',
                                    allow          => 'from all' } ]

  # lint:endignore:strict_indent
}
