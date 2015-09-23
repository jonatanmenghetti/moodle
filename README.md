[![Build Status](https://travis-ci.org/jonatanmenghetti/moodle.svg?branch=master)](https://travis-ci.org/jonatanmenghetti/moodle)


#### This module is a fork from Firebladee-moodle

This module will build moodle on target server.

This moodle module is very limited at the moment.
Most variables are hard coded, some are set in params file some are set as paramenters but these are not yet configured to be past through from init.pp.

[*install types*]
 - git - This is all hardcoded in git.pp for now.
 - file - This is hardcoded but is set as parameters but not yet synced through from init.pp

[*Databases*]
  - mysql - This is created through params.pp.  This bit is tested.  Have set the parameter to be done through init.pp but not tested this bit yet.
  - postgresql - This is all hardcoded in postgresql.pp for now.

[*Web Servers*]
  - Apache - This is all hardcoded in apache1.pp for now.

[*Building*]
  - Auto - This is all hardcoded for now.

[*Examples*]

  A basic 'include moodle' will download moodle tar file.  Install mysql and apache and auto create the config.php file.
  From there you only need to login to the web page and create your courses.


This is very early code, so please use at your discression.
