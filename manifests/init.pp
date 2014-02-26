
class moodle (

){

# package git
  # add case for different os
  package { 'git': ensure => latest, }

# create directory
  $dirtree = dirtree('/var/www/html')
  ensure_resource('File', $dirtree, {
    ensure => directory,
    mode   => '0755',
  })

# git clone moodle
  exec { 'Base clone':
    command => 'git clone git@github.com:moodle/moodle.git',
  # onlyif => 'Somefile does not exist',
  }

# create data directory
  $dirtree1 = dirtree('/opt/moodle')
  ensure_resources('File', $dirtree, {
    ensure => directory,
    mode   => '0777',
  })

# get database info
# create config.php
# apache vhost
# set up cron

}
