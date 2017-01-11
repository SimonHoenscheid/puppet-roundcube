# == Class: roundcube::config
#
# Configure roundcube
#
class roundcube::config inherits roundcube {
  #this is now config.inc.php, the split is gone
  file { 'roundcube config.inc.php':
    ensure  => file,
    path    => "${::roundcube::confdir}/config.inc.php",
    owner   => 'root',
    group   => 'www-data',
    mode    => '0640',
    content => template($::roundcube::config_inc_php_erb),
  }

}
