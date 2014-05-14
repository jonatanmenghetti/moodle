
class moodle::install::auto () inherits moodle::params {

  exec{'moodle_auto':
    command => "/usr/bin/php admin/cli/install.php \
      --dbname=moodledb \
      --dbuser=fred \
      --dbpass=fredblogs \
      --adminpass=fredblogs \
      --agree-license \
      --lang=en \
      --non-interactive \
      --wwwroot=http://127.0.0.1:4568/moodle \
      --dataroot=/opt/moodle \
      --fullname='test site' \
      --shortname=testsite",
    creates => '/var/www/html/moodle/config.php',
    cwd     => '/var/www/html/moodle',
    group   => 'apache',
  }


#  ensure_resource('file', '/var/www/html/moodle/config.php', {
#    ensure  => present,
#    content => template('moodle/config.php.erb'),
#    owner   => root,
#    group   => apache,
#  })

}


#sudo -u apache /usr/bin/php admin/cli/install.php --dbname=moodledb --dbuser=fred --dbpass=fredblogs --adminpass=fredblogs --agree-license --lang=en --non-interactive --wwwroot=http://127.0.0.1:4568/moodle --dataroot=/opt/moodle --fullname='test site' --shortname=testsite
