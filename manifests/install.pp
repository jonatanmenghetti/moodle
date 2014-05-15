

class moodle::install (

  $install = ''

){

  case $install {
    git:     {class{'moodle::install::git':}}
    file:    { include moodle::install::file }
    default: {notify{"Build type ${install} not yet known":}}
  }

  # create data directory
  $dirtree1 = dirtree('/opt/moodle', '/opt')
  ensure_resource('File', $dirtree1, {
    ensure => directory,
    mode   => '0770',
    owner  => 'root',
    group  => 'apache',
  })
}
