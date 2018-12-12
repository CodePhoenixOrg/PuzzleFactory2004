<?php   
	include_once("ipz_mysqlconn.php");
	include_once("ipz_db_controls.php");
	$cs=connection(CONNECT,$database);
	$query = get_variable("query");
	$event = get_variable("event");
	$action = get_variable("action");
	$db_id = get_variable("db_id");
	if(empty($query)) $query="SELECT";
	if(empty($event)) $event="onLoad";
	if(empty($action)) $action="Ajouter";
	if(isset($pc)) $curl_pager="&pc=$pc";
	if(isset($sr)) $curl_pager.="&sr=$sr";
	if($event=="onLoad" && $query=="ACTION") {
		switch ($action) {
		case "Ajouter":

			$sql="select max(db_id) from db;";
			$result = mysql_query($sql, $cs);
			$rows = mysql_fetch_array($result);
			$db_id=$rows[0]+1;
			$db_name="";
			$db_server="";
			$db_site="";
		break;
		case "Modifier":
			$sql="select * from db where db_id='$db_id';";
			$result = mysql_query($sql, $cs);
			$rows = mysql_fetch_array($result);
			$db_id=$rows["db_id"];
			$db_name=$rows["db_name"];
			$db_server=$rows["db_server"];
			$db_site=$rows["db_site"];
		break;
		}
	} else if($event=="onRun" && $query=="ACTION") {
		switch ($action) {
		case "Ajouter":
			$db_id = $_POST["db_id"];
			$db_name = $_POST["db_name"];
			$db_server = $_POST["db_server"];
			$db_site = $_POST["db_site"];
			$db_name=escapeChars($db_name);
			$sql="insert into db (".
				"db_id, ".
				"db_name, ".
				"db_server, ".
				"db_site".
			") values (".
				"$db_id, ".
				"'$db_name', ".
				"$db_server, ".
				"$db_site".
			")";
			$result = mysql_query($sql, $cs);
		break;
		case "Modifier":
			$db_id = $_POST["db_id"];
			$db_name = $_POST["db_name"];
			$db_server = $_POST["db_server"];
			$db_site = $_POST["db_site"];
			$db_name=escapeChars($db_name);
			$sql="update db set ".
				"db_id=$db_id, ".
				"db_name='$db_name', ".
				"db_server=$db_server, ".
				"db_site=$db_site ".
			"where db_id='$db_id'";
			$result = mysql_query($sql, $cs);
		break;
		case "Supprimer":
			$sql="delete from db where db_id='$db_id'";
			$result = mysql_query($sql, $cs);
		break;
		}
		$query="SELECT";
	} else if($event=="onUnload" && $query=="ACTION") {
		$cs=connection(DISCONNECT,$database);
		echo "<script language='JavaScript'>window.location.href='page.php?id=34&lg=fr'</script>";
	}
?>
