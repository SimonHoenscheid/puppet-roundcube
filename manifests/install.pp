# == Class: roundcube::install
#
# Install roundcube from package
#
class roundcube::install {

  package { "roundcube-${::roundcube::database_backend}":
    ensure  => installed,
  } ->

  package { 'roundcube':
    ensure  => installed,
  } ->

  package { 'roundcube-plugins':
    ensure  => installed,
  } ->

  exec { 'dpkg-reconfigure roundcube':
    command     => 'dpkg-reconfigure roundcube-core',
    refreshonly => true,
    path        => $::path,
  }

}
