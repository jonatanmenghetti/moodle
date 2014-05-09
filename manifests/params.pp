

class moodle::params {

  $moodle_mysql = {
    mysql => {
      users => {
        'fred@localhost' => {
          ensure        => 'present',
          password_hash => '*185D87D3277588C7D8ABF3D1F2D3AA89B1D73416',
        }
      }
    }
  }

}
