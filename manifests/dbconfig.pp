# == Class: roundcube::dbconfig
#
# Set up dbconfig-common for preseeding
#
class roundcube::dbconfig {

  ensure_packages([ 'dbconfig-common' ])
  Package['dbconfig-common'] ->

  file { 'dbconfig-common roundcube':
    ensure => file,
    path   => '/etc/dbconfig-common/roundcube.conf',
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
  }

  #Set the defaults
  Ini_setting {
    path              => '/etc/dbconfig-common/roundcube.conf',
    ensure            => present,
    section           => '',
    key_val_separator => '=',
    notify            => Exec['dpkg-reconfigure roundcube'],
    require           => File['dbconfig-common roundcube'],
  }

  # TODO: figure out some way to make sure that the ini_file module is installed,
  #  because otherwise these will silently fail to do anything.
  # TODO(mf): ???

  ini_setting { 'dbc_install':
    setting => 'dbc_install',
    value   => false,
  }

  ini_setting { 'dbc_upgrade':
    setting => 'dbc_upgrade',
    value   => false,
  }

  ini_setting {'dbtype':
    setting => 'dbc_dbtype',
    value   => "'${::roundcube::database_backend}'",
  }

  ini_setting {'dbuser':
    setting => 'dbc_dbuser',
    value   => "'${::roundcube::database_username}'",
  }

  ini_setting {'dbpass':
    setting => 'dbc_dbpass',
    value   => "'${::roundcube::database_password}'",
  }

  ini_setting {'dbname':
    setting => 'dbc_dbname',
    value   => "'${::roundcube::database_name}'",
  }

  ini_setting {'dbserver':
    setting => 'dbc_dbserver',
    value   => "'${::roundcube::database_host}'",
  }

  ini_setting {'dbport':
    setting => 'dbc_dbport',
    value   => "'${::roundcube::database_port}'",
  }

  ini_setting {'dbssl':
    setting => 'dbc_ssl',
    value   => "'${::roundcube::database_ssl}'",
  }

}
