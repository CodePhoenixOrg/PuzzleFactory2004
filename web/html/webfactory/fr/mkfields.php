<center>
<?php   
	//if(empty($userdb)) $userdb="webfactory";
	$userdb=$_POST["userdb"];
	$usertable=$_POST["usertable"];
	$dbgrid=$_POST["dbgrid"];
	$menu=$_POST["menu"];
	$filter=$_POST["filter"];
	$addoption=$_POST["addoption"];
	$me_id=$_POST["me_id"];
	$me_level=$_POST["me_level"];
	$bl_id=$_POST["bl_id"];
	$pa_filename=$_POST["pa_filename"];
	$extension=$_POST["extension"];
	$basedir=$_POST["basedir"];
	
	$cs=connection(CONNECT, $userdb) or die("UserDb='$userdb'<br>");
	$tmp_filename="tmp.php";
	$wwwroot=get_www_root();
	//$filepath="$wwwroot/../$userdb/fr/$pa_filename";
	//$filedir="$wwwroot/../$userdb/fr/";
	
	$relations=relations($userdb, $usertable, $cs);
	
	$relation_tables=$relations["relation_tables"];
	$relation_fields=$relations["relation_fields"];
	$form_fields=$relations["form_fields"];
	$field_defs=$relations["field_defs"];
	
	echo "<br>";
	
	$list="LABEL,SELECT,TEXT,TEXTAREA";
	
	$hidden="";
	$hidden.="<input type='hidden' name='userdb' value='$userdb'>\n";
	$hidden.="<input type='hidden' name='usertable' value='$usertable'>\n";
	$hidden.="<input type='hidden' name='dbgrid' value='$dbgrid'>\n";
	$hidden.="<input type='hidden' name='menu' value='$menu'>\n";
	$hidden.="<input type='hidden' name='filter' value='$filter'>\n";
	$hidden.="<input type='hidden' name='addoption' value='$addoption'>\n";
	$hidden.="<input type='hidden' name='me_id' value='$me_id'>\n";
	$hidden.="<input type='hidden' name='me_level' value='$me_level'>\n";
	$hidden.="<input type='hidden' name='bl_id' value='$bl_id'>\n";
	$hidden.="<input type='hidden' name='pa_filename' value='$pa_filename'>\n";
	$hidden.="<input type='hidden' name='extension' value='$extension'>\n";
	$hidden.="<input type='hidden' name='basedir' value='$basedir'>\n";
	$hidden.="<input type='hidden' name='pz_current_tab' value=''>\n";
	
	$mk_fields="
	<fieldset style='width:450px;'>\n
	<legend>Créer un script à partir d'une table</legend>
	<table border='0' bordercolor='0' width='85%' valign='top' style='display:hidden;'>\n
	<tr><td>\n
	<table border='0' cellspacing='0' cellpadding='0'>\n
	<tr><td>Nom</td>\n
	<td>Taille DB</td>\n
	<td>Type DB</td>\n
	<td>Type HTML</td>\n
	<td>Largeur</td>\n
	<td>Hauteur</td>\n
	</tr>\n";
	foreach($field_defs as $def) {
		$defs=explode(",", $def);
		$mk_fields.="<tr>\n";
		$options=create_options_from_array($list, ",", 0, 0, array(), $defs[3], false);
		$mk_fields.="<td><input type='text' size='25' value=\"$defs[0]\"></td>\n";
		$mk_fields.="<td><input type='text' readonly size='5' value=\"$defs[1]\"></td>\n";
		$mk_fields.="<td><input type='text' readonly size='5' value=\"$defs[2]\"></td>\n";
		//echo "<td><input type='text' readonly size='8' value=\"$defs[3]\"></td>\n";
		$mk_fields.="<td><select name='$defs[3]'>".$options["list"]."</select></td>\n";
		$mk_fields.="<td><input type='text' size='5' value=\"$defs[4]\"></td>\n";
		$mk_fields.="<td><input type='text' size='5' value=\"$defs[5]\"></td>\n";
		$mk_fields.="</tr>\n";
	}
	$mk_fields.="
	</table>\n
	</td></tr>\n
	<tr><td colspan='3' align='center'>
	<br>\n<input type='button' name='previous' value='<< Précédent' onClick='document.myForm.action=\"page.php?id=29&lg=$lg\";document.myForm.submit()'>
	&nbsp;\n<input type='button' name='next' value='Suivant >>' onClick='document.myForm.action=\"page.php?id=33&lg=$lg\";document.myForm.submit()'>\n
	</td></tr>\n
	</table>\n
	</fieldset>\n
	";
	
	echo "<form name='myForm' method='POST' action=''>\n";
	echo $hidden;
	echo $mk_fields;
	echo "</form>\n";
?>
</center>
