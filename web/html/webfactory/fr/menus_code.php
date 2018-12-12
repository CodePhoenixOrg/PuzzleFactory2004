<?php    
	include_once 'puzzle/ipz_mysqlconn.php';
	include_once 'puzzle/ipz_db_controls.php';
	$cs=connection(CONNECT,$database);
	$query = get_variable("query");
	$event = get_variable("event");
	$action = get_variable("action");
	$me_id = get_variable("me_id");
	if(empty($query)) $query="SELECT";
	if(empty($event)) $event="onLoad";
	if(empty($action)) $action="Ajouter";
	if(isset($pc)) $curl_pager="&pc=$pc";
	if(isset($sr)) $curl_pager.="&sr=$sr";
	if($event=="onLoad" && $query=="ACTION") {
		switch ($action) {
		case "Ajouter":

			$sql="select max(me_id) from menus;";
			$result = mysql_query($sql, $cs);
			$rows = mysql_fetch_array($result);
			$me_id=$rows[0]+1;
			$me_level="";
			$me_target="";
			$pa_id="";
			$bl_id="";
			$di_name="";
			$grp_group="";
			$me_charset="";
		break;
		case "Modifier":
			$sql="select * from menus where me_id='$me_id';";
			$result = mysql_query($sql, $cs);
			$rows = mysql_fetch_array($result);
			$me_id=$rows["me_id"];
			$me_level=$rows["me_level"];
			$me_target=$rows["me_target"];
			$pa_id=$rows["pa_id"];
			$bl_id=$rows["bl_id"];
			$di_name=$rows["di_name"];
			$grp_group=$rows["grp_group"];
			$me_charset=$rows["me_charset"];
		break;
		}
	} else if($event=="onRun" && $query=="ACTION") {
		switch ($action) {
		case "Ajouter":
			$sql="insert into menus (".
				"me_id, ".
				"me_level, ".
				"me_target, ".
				"pa_id, ".
				"bl_id, ".
				"di_name, ".
				"grp_group, ".
				"me_charset".
			") values (".
				"'$me_id', ".
				"'$me_level', ".
				"'$me_target', ".
				"'$pa_id', ".
				"'$bl_id', ".
				"'$di_name', ".
				"'$grp_group', ".
				"'$me_charset'".
			")";
			$result = mysql_query($sql, $cs);
		break;
		case "Modifier":
			$me_id = $_POST["me_id"];
			$me_level = $_POST["me_level"];
			$me_target = $_POST["me_target"];
			$pa_id = $_POST["pa_id"];
			$bl_id = $_POST["bl_id"];
			$di_name = $_POST["di_name"];
			$grp_group = $_POST["grp_group"];
			$me_charset = $_POST["me_charset"];
			$sql="update menus set ".
				"me_id='$me_id', ".
				"me_level='$me_level', ".
				"me_target='$me_target', ".
				"pa_id='$pa_id', ".
				"bl_id='$bl_id', ".
				"di_name='$di_name', ".
				"grp_group='$grp_group', ".
				"me_charset='$me_charset' ".
			"where me_id='$me_id'";
			$result = mysql_query($sql, $cs);
		break;
		case "Supprimer":
			$sql="delete from menus where me_id='$me_id'";
			$result = mysql_query($sql, $cs);
		break;
		}
		$query="SELECT";
	} else if($event=="onUnload" && $query=="ACTION") {
		$cs=connection(DISCONNECT,$database);
		echo "<script language='JavaScript'>window.location.href='page.php?id=18&lg=fr'</script>";
	}
?>
