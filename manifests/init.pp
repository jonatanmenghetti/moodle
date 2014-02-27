
class moodle (

){

# package git
  # add case for different os
  package { 'git': ensure => latest, }

# create directory
  $dirtree = dirtree('/var/www/html')
  ensure_resource('File', $dirtree, {
    ensure => directory,
#    mode   => '0755',
  })

# git clone moodle
  exec { 'Base clone':
    command => 'git clone git@github.com:moodle/moodle.git',
    cwd => '/var/www/html',
    path => '/usr/bin',
    creates => '/var/www/html/moodle',
  }

# create data directory
  $dirtree1 = dirtree('/opt/moodle')
  ensure_resource('File', $dirtree1, {
    ensure => directory,
    mode   => '0777',
  })

# get database info

# create config.php
  ensure_resource('File', '/var/www/html/moodle/config.php', {
    ensure => present,
    source => 'puppet:///modules/moodle/config.php',
  })

# apache vhost
  class { 'apache':}
  apache::vhost {'moodle':
    port => '80',
    docroot => '/var/www/html/moodle',
    aliases => {
      alias => '/mymoodle',
      path => '/var/www/html/moodle',
    }
  }
  class { 'apache::mod::php':}

# set up cron
  cron { moodle:
    command => '/usr/bin/wget -O /dev/null http://localhost/mymoodle/admin/cron.php',
    user => root, # moodle user
    minute => '*/5',
  }
}
