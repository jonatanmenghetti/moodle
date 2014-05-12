
class moodle::databases (
  $database = '',
){

  if $database != '' {
    case $database {
      mysql: { create_resources('class', $::moodle::params::moodle_mysql)}
      default: { notify{"${database} is not yet supported":}}
    }
  }
}
