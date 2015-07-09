# == Class: roundcube::apache
#
# Configure the Apache config file for roundcube
#
class roundcube::apache {

  if ! defined(Class['::apache']) {
    warning('Declaring Apache myself, you should do that - with prefork enabled!')
    class { '::apache':
      mpm_module => 'prefork',
    }
  }
  include ::apache
  include ::apache::mod::actions
  include ::apache::mod::php
  include ::apache::mod::mime
  include ::apache::mod::deflate

  ::apache::custom_config { 'roundcube':
    source => "${::roundcube::confdir}/apache.conf",
  }
  ::apache::custom_config { 'roundcube-alias':
    content => "# Managed by Puppet
      Alias /roundcube/program/js/tiny_mce/ /usr/share/tinymce/www/
      Alias /roundcube /var/lib/roundcube
    ",
  }

}
