<?php
define(CONNECT, "connect");
define(DISCONNECT, "disconnect");

function connection($c="", $d="") { 
	$host="mysql";
	$user="root";
	$passwd="demo";
	$dbname=$d;

	$myconn=mysql_pconnect($host, $user, $passwd) or die("Connection failed");
	if($c=="connect") 
		mysql_select_db($dbname, $myconn);
	else if($c=="disconnect") 
		mysql_close($myconn);
	
	return $myconn;
}
?>
