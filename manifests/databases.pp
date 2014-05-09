
class moodle::databases (
  $database = ''

){

  if $database != '' {
    case $database {
      mysql: { include moodle::databases::mysql}
      default: { notify{"${database} is not yet supported":}}
    }
  }
}
