
class moodle::web (
  $web = ''

){

  if $web != '' {
    case $web {
      apache: { class{'moodle::web::apache1':}}
      default: { notify{"${web} not yet implemented":}}
    }
  }
}
