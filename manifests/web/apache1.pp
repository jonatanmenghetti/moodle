

class moodle::web::apache1 (
  $vhost_port    = '80',
  $vhost_docroot = '/var/www/html/moodle',

# $apache_mod = array
# $php_mod = array
){

  class { 'apache': }
  apache::vhost {'moodle':
    port    => $vhost_port,
    docroot => $vhost_docroot,
    aliases => {
      alias => '/mymoodle',
      path  => '/var/www/html/moodle',
    }
  }
  class { 'apache::mod::php':}
  class { 'apache::mod::ssl':}

  class {'php':}
  php::module{'gd':}
  php::module{'mbstring':}
  php::module{'xmlrpc':}
  php::module{'soap':}
  php::module{'intl':}
  php::module{'pecl-zendopcache':}

}
