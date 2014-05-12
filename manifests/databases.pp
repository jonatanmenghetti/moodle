
class moodle::databases (
  $database = '',
){

  if $database != '' {
    case $database {
      mysql: {
        package{'php-pear-MDB2-Driver-mysqli': ensure => installed}
        create_resources('class', $::moodle::params::moodle_mysql)}
      default: { notify{"${database} is not yet supported":}}
    }
  }
}
