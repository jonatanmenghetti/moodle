

class moodle::install (

  $install = ''

){

  case $install {
    git:     {class{'moodle::install::git':}}
    default: {notify{'Build type ${install} not yet known':}}
  }

  # create data directory
  $dirtree1 = dirtree('/opt/moodle')
  ensure_resource('File', $dirtree1, {
    ensure => directory,
#    mode   => '0777', # Need to find correct mode.
  })


}
