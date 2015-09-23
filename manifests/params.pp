class moodle::params{

  $dbtype               = mysqli
  $dblibrary            = native
  $dbhost               = localhost
  $dbuser               = moodle
  $prefix               = 'mdl_'
  $wwwroot              = "http://${::ipaddress}"
  $dataroot             = '/opt/moodle'
  $admin                = admin
  $directorypermissions = 0777 # Change me from this dangeraus default.

  if ! $::moodle::db_name {
    $dbname = 'moodle'
  } else {
   $dbname = $::moodle::db_name
  }

  if ! $::moodle::db_pass {
    $dbpass = 'x98h2inxebc'
  } else {
   $dbpass = $::moodle::dbpass
 }


  $moodle_mysql = {
    mysql::server => {
      users => {
        "${::moodle::db_user}@localhost" => {
          ensure        => 'present',
          password_hash => mysql_password("${dbpass}"),
        }
      },
      grants => {
        "${::moodle::db_user}@localhost/${dbname}.*" => {
          ensure     => 'present',
          options    => ['GRANT'],
          privileges => [
            'SELECT',
            'INSERT',
            'UPDATE',
            'DELETE',
            'CREATE',
            'CREATE TEMPORARY TABLES',
            'DROP',
            'INDEX',
            'ALTER',
          ],
          table      => "${dbname}.*",
          user       => "${::moodle::db_user}@localhost",
        }
      },
      databases => {
        "${dbname}" => {
          ensure  => 'present',
          charset => 'utf8',
          collate => 'utf8_unicode_ci',
        }
      },
    }
  }

  $dboptions = {
    dbpersist => 0,
    dbport    => '',
    dbsocket  => '',
  }
}
