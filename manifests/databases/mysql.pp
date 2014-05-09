

class moodle::databases::mysql {

#  include moodle::params

  notify{'moodle databases mysql':}

  notify{"moodle mysql hash = ${::moodle::params::moodle_mysql}":}

  
#  create_resources('mysql::server', $::moodle::params::moodle_mysql)

  create_resources('class', $::moodle::params::moodle_mysql)

#  class { '::mysql::server':
#    users => {
#      'fred@localhost'=> {
#        ensure        => 'present',
#        password_hash => '*185D87D3277588C7D8ABF3D1F2D3AA89B1D73416',
#      }
#    },

#    grants => {
#      'fred@localhost/moodledb.*' => {
#        ensure     => 'present',
#        options    => ['GRANT'],
#        privileges => [
#          'SELECT',
#          'INSERT',
#          'UPDATE',
#          'DELETE',
#          'CREATE',
#          'CREATE TEMPORARY TABLES',
#          'DROP',
#          'INDEX',
#          'ALTER',
#        ],
#        table      => 'moodledb.*',
#        user       => 'fred@localhost',
#      }
#    },

#    databases => {
#      'moodledb' => {
#        ensure  => 'present',
#        charset => 'utf8',
#        collate => 'utf8_unicode_ci',
#      }  
#    }  
#  }   
}

