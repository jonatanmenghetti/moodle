
class moodle (

  $install  = true,
  $web      = true,
  $database = true,
  $auto     = true,

  $install_type  = 'file',
  $web_type      = 'apache',
  $database_type = 'mysql',

  $moodle_mysql = $moodle::params::moodle_mysql,
  $dbtype       = $moodle::params::dbtype,
  $dblibrary    = $moodle::params::dblibrary,
  $dbhost       = $moodle::params::dbhost,
  $db_user      = $moodle::params::dbuser,
  $db_name      = $moodle::params::dbname,
  $db_pass       = $moodle::params::dbpass,
  $prefix       = $moodle::params::prefix,
  $wwwroot      = $moodle::params::wwwroot,
  $dataroot     = $moodle::params::dataroot,
  $admin        = $moodle::params::admin,

  $directorypermissions = '0777',

  $dboptions = $moodle::params::dboptions,

){

#  include moodle::params

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
