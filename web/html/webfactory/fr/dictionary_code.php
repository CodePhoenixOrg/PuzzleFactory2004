<?php    
	include_once 'puzzle/ipz_mysqlconn.php';
	include_once 'puzzle/ipz_db_controls.php';
	$cs=connection(CONNECT,$database);
	$query = get_variable("query");
	$event = get_variable("event");
	$action = get_variable("action");
	$di_name = get_variable("di_name");
	if(empty($query)) $query="SELECT";
	if(empty($event)) $event="onLoad";
	if(empty($action)) $action="Ajouter";
	if(isset($pc)) $curl_pager="&pc=$pc";
	if(isset($sr)) $curl_pager.="&sr=$sr";
	if($event=="onLoad" && $query=="ACTION") {
		switch ($action) {
		case "Ajouter":

			$sql="select max(di_name) from dictionary;";
			$result = mysql_query($sql, $cs);
			$rows = mysql_fetch_array($result);
			$di_name=$rows[0]+1;
			$di_fr_short="";
			$di_fr_long="";
			$di_en_short="";
			$di_en_long="";
			$di_ru_short="";
			$di_ru_long="";
		break;
		case "Modifier":
			$sql="select * from dictionary where di_name='$di_name';";
			$result = mysql_query($sql, $cs);
			$rows = mysql_fetch_array($result);
			$di_name=$rows["di_name"];
			$di_fr_short=$rows["di_fr_short"];
			$di_fr_long=$rows["di_fr_long"];
			$di_en_short=$rows["di_en_short"];
			$di_en_long=$rows["di_en_long"];
			$di_ru_short=$rows["di_ru_short"];
			$di_ru_long=$rows["di_ru_long"];
		break;
		}
	} else if($event=="onRun" && $query=="ACTION") {
		switch ($action) {
		case "Ajouter":
			$sql="insert into dictionary (".
				"di_name, ".
				"di_fr_short, ".
				"di_fr_long, ".
				"di_en_short, ".
				"di_en_long, ".
				"di_ru_short, ".
				"di_ru_long".
			") values (".
				"'$di_name', ".
				"'$di_fr_short', ".
				"'$di_fr_long', ".
				"'$di_en_short', ".
				"'$di_en_long', ".
				"'$di_ru_short', ".
				"'$di_ru_long'".
			")";
			$result = mysql_query($sql, $cs);
		break;
		case "Modifier":
			$di_name = $_POST["di_name"];
			$di_fr_short = $_POST["di_fr_short"];
			$di_fr_long = $_POST["di_fr_long"];
			$di_en_short = $_POST["di_en_short"];
			$di_en_long = $_POST["di_en_long"];
			$di_ru_short = $_POST["di_ru_short"];
			$di_ru_long = $_POST["di_ru_long"];
			$sql="update dictionary set ".
				"di_name='$di_name', ".
				"di_fr_short='$di_fr_short', ".
				"di_fr_long='$di_fr_long', ".
				"di_en_short='$di_en_short', ".
				"di_en_long='$di_en_long', ".
				"di_ru_short='$di_ru_short', ".
				"di_ru_long='$di_ru_long' ".
			"where di_name='$di_name'";
			$result = mysql_query($sql, $cs);
		break;
		case "Supprimer":
			$sql="delete from dictionary where di_name='$di_name'";
			$result = mysql_query($sql, $cs);
		break;
		}
		$query="SELECT";
	} else if($event=="onUnload" && $query=="ACTION") {
		$cs=connection(DISCONNECT,$database);
		echo "<script language='JavaScript'>window.location.href='page.php?id=21&lg=fr'</script>";
	}
?>
