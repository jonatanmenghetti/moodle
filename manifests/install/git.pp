
class moodle::install::git {

  # package git
  # add case for different os
  package { 'git': ensure => latest, }

  # create directory
  $dirtree = dirtree('/var/www/html')
  ensure_resource('File', $dirtree, {
    ensure => directory,
#    mode   => '0755',  # Need to find correct mode.
  })

  # git clone moodle
  # Add your github key from your own puppet module for this to work.
  exec { 'Base clone':
    command => 'git clone git@github.com:moodle/moodle.git',
    cwd     => '/var/www/html',
    path    => '/usr/bin',
    timeout => 600,
    creates => '/var/www/html/moodle/README.txt',
  }
}
