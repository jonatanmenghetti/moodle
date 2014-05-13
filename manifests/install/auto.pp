
class moodle::install::auto () inherits moodle::params {

  ensure_resource('file', '/var/www/html/moodle/config.php', {
    ensure  => present,
    content => template('moodle/config.php.erb'),
    owner   => root,
    group   => apache,
  })

}
