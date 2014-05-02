
class moodle::web (
  $web = ''

){

  if $web != '' {
    case $web {
      apache: { class{'moodle::web::apache':}}
      default: { Notify{'${web} not yet implemented':}}
    }
  }
}
