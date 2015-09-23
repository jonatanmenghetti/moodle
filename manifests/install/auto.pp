class moodle::install::auto () inherits moodle::params {

  exec{'moodle_auto':
    command => "/usr/bin/php admin/cli/install.php \
      --dbtype=$dbtype \
      --dbname=$dbname \
      --dbuser=$dbuser \
      --dbpass=$dbpass \
      --adminpass=$dbpass \
      --agree-license \
      --lang=en \
      --non-interactive \
      --wwwroot=$wwwroot \
      --dataroot=$dataroot \
      --fullname='test site' \
      --shortname=testsite",
    creates => "/var/www/moodle/config.php",
    cwd     => "/var/www/moodle",
    group   => 'apache',
  }
}
