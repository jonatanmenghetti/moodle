
class moodle (

  $install  = true,
  $web      = true,
  $database = true,
  $auto     = true,

  $install_type  = 'git',
  $web_type      = 'apache',
  $database_type = 'mysql',

  $db_name = 'moodle',
  $db_user = 'fred',

){


  if $install {
    class{'moodle::install':
      install => $install_type,
  }}

  if $auto {
    include moodle::install::auto
  }

  if $database {
    class{'moodle::databases':
      database => $database_type,
  }}

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
