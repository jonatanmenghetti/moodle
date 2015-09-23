

class moodle::web::apache1 {

  class { 'apache':}
  apache::vhost {'moodle':
    port    => '80',
    docroot => '/var/www/html/moodle',
    aliases => {
    alias   => '/mymoodle',
    path    => '/var/www/html/moodle',
    }
  }
  class { 'apache::mod::php':}

  class {'php':}
  php::module{'gd':}
  php::module{'mbstring':}
  php::module{'xmlrpc':}
  php::module{'soap':}
  php::module{'intl':}
  php::module{'pecl-zendopcache':}


}
