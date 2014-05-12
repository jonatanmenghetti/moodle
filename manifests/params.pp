

class moodle::params {

  $moodle_mysql = {
    mysql::server => {
      users => {
        "${::moodle::db_user}@localhost" => {
          ensure        => 'present',
          password_hash => '*185D87D3277588C7D8ABF3D1F2D3AA89B1D73416',
        }
      },
      grants => {
        "${::moodle::db_user}@localhost/${::moodle::db_name}.*" => {
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
          table      => "${::moodle::db_name}.*",
          user       => "${::moodle::db_user}@localhost",
        }
      },
      databases => {
        "${::moodle::db_name}" => {
          ensure  => 'present',
          charset => 'utf8',
          collate => 'utf8_unicode_ci',
        }
      },
    }
  }
}
