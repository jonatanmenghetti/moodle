
class moodle::database (
  $database = ''

){

  if $database != '' {
    class {'mysql::server':
      databases => {
        'moodle' => {
          ensure  => 'present',
          charset => 'utf8',
          collate => 'utf8_bin',
        }
      }
    }
  }
}
