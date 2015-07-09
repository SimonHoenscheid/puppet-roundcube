# == Class: roundcube::config
#
# Configure roundcube
#
class roundcube::config inherits roundcube {

  file { 'roundcube main.inc.php':
    ensure  => file,
    path    => "${::roundcube::confdir}/main.inc.php",
    owner   => 'root',
    group   => 'www-data',
    mode    => '0640',
    content => template($::roundcube::main_inc_php_erb),
  }

}
