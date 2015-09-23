
class moodle::install::file (

  $download 	= 'http://ufpr.dl.sourceforge.net/project/moodle/Moodle/stable27/moodle-2.7.tgz',
  $destination = '/tmp/moodle.tgz',
  $cache_dir   = '/var/cache/wget',

  $tar     = 'tar -zxvf /tmp/moodle.tgz',
  $cwd     = '/var/www',
  $path    = '/bin',
  $creates = '/var/www/moodle/README.txt',

){

  wget::fetch { $download:
    destination => $destination,
    cache_dir   => $cache_dir,
  }

  exec{ $tar :
    cwd         => $cwd,
    path        => $path,
    creates     => $creates,
    subscribe   => wget::fetch[$download],
    refreshonly => true,
  }

}
