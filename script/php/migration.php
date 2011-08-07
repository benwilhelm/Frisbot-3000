#!/usr/bin/php
===================

<?php 

define('OLDHOST','mysql.benwilhelm.com') ;
define('OLDUSER','benwilhelm_admin') ;
define('OLDPASS','baednmwiin') ;
define('OLDDB','frisbeecollective') ;

define('NEWHOST','localhost') ;
define('NEWUSER','dbdgadmin') ;
define('NEWPASS','MySQL{1981}kie') ;
define('NEWDB','frisbot_staging') ;

$old = mysqli_connect(OLDHOST, OLDUSER, OLDPASS, OLDDB) or die("Could not connect to " . OLDDB) ;
$new = mysqli_connect(NEWHOST, NEWUSER, NEWPASS, NEWDB) or die("Could not connect to " . NEWDB) ;

$oldCheck = mysqli_fetch_array($old->query("SELECT DATABASE ;")) ;
echo "Connected to $oldCheck\n" ;

$newCheck = mysqli_fetch_array($new->query("SELECT DATABASE ;")) ;
echo "Connected to $newCheck\n" ;


?>