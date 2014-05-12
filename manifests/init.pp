
class moodle (

  $install  = true,
  $web      = true,
  $database = true,

  $install_type  = 'git',
  $web_type      = 'apache',
  $database_type = 'mysql',

  $db_user = 'fred',
  $db_name = 'moodledb',

){

  include moodle::params

  if $install {
    class{'moodle::install':
      install => $install_type,
  }}

  if $database {
    class{'moodle::databases':
      database => $database_type,
  }}

  # create config.php
#  ensure_resource('File', '/var/www/html/moodle/config.php', {
#    ensure  => present,
#    content => template('moodle/config.php.erb'),
#    require => Exec['Base clone'],
#  })

  if $web {
    class{'moodle::web':
      web => $web_type,
  }}

  # set up cron
#  cron { 'moodle':
#    command => '/usr/bin/wget -O /dev/null http://localhost/mymoodle/admin/cron.php',
#    user    => root, # moodle user
#    minute  => '*/5',
#  }
}
