<?php
$ip = $_SERVER['SERVER_ADDR'];
echo "<b>Container IP is: $ip", "<br>";
echo "<b>PHP Version: " . phpversion(). "<br>";
echo "<b> DB Server Host: </b>" . (getenv('DBHOST')?:'192.168.0.1'). "<br>";
echo "<b> DB Server Port: </b>" . (getenv('DBPORT')?:'5432'). "<br>";
echo "<b> DB Server User: </b>" . (getenv('DBUSER')?:'postgresql'). "<br>";
echo "<b> DB Server Password: </b>" . (getenv('DBPASSWD')?:'admin'). "<br>";
?>
