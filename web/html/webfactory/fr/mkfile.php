<center>
<?php   
	include_once 'puzzle/ipz_source.php';
        include_once 'puzzle/ipz_analyser.php';

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
	$save=$_POST["save"];
	
	$cs=connection(CONNECT, $userdb) or die("UserDb='$userdb'<br>");
	$tmp_filename='tmp_'.$pa_filename;
	$wwwroot=get_www_root();
        
      	$relations=relations($userdb,$usertable,$cs);
	$A_fieldDefs=$relations["field_defs"];

	
	echo "<br>";
		
	$http_root=get_http_root();

	if($save=="Oui") {
		
		//$pa_filename.=$extension;
		$catalog_pa_filename=$pa_filename;
		$pa_filename=$wwwroot.$basedir.'/'.$pa_filename;
	
		if($pa_filename!="") {
			//copy('tmp_single.php', $pa_filename.$extension);
			//copy('tmp_page.php', $pa_filename.$extension);
			copy('tmp_code.php', $pa_filename.'_code'.$extension);
			
//			copy('tmp_browse.php', $pa_filename.'_browse'.$extension);
//			copy('tmp_form.php', $pa_filename.'_form'.$extension);
//			copy('tmp_insert.php', $pa_filename.'_insert'.$extension);
//			copy('tmp_update.php', $pa_filename.'_update'.$extension);
//			copy('tmp_delete.php', $pa_filename.'_delete'.$extension);
			
		}
		if(!isset($me_level)) $me_level="1";
		$new_pa_id="";
		$di_name=$usertable;
		$di_fr_short=strtoupper(substr($usertable,0,1)).substr($usertable, 1, strlen($usertable)-1);
		$di_fr_long="Liste des $usertable";

		if($catalog==0 && $autogen==1) {
			$catalog=add_menu(
				$userdb,
				$me_id, $di_name, $me_level, $me_target,
				$pa_id, $new_pa_id, $catalog_pa_filename,
				$di_fr_short, $di_fr_long, $di_en_short, $di_en_long
			);
		}
		
	} elseif($save=="") {
 
		$formname="fiche_$usertable";
		$sql="show fields from $usertable;";

		$L_sqlFields="";
		$A_sqlFields=Array();
		
		$result = mysql_query($sql, $cs) or die("SQL='$sql'<br>");
		while($rows=mysql_fetch_array($result)) {
			$L_sqlFields.=$rows[0].",";
		}
		$L_sqlFields=substr($L_sqlFields, 0, strlen($L_sqlFields)-1);
		$A_sqlFields=explode(",", $L_sqlFields);
		$indexfield=$A_sqlFields[0];
		$secondfield=$A_sqlFields[1];
		
		$catalog_pa_filename=$pa_filename.$extension;
		$catalog=get_menu_id($userdb, $catalog_pa_filename);
		
		echo "Catalog file name: $catalog_pa_filename<br>";
		
		if($catalog==0) $catalog=get_next_menu_id($userdb);
		
		$script_exists=file_exists("$basedir/$catalog_pa_filename");

		if($script_exists) {
			echo "<font color='red'><p>Le script $catalog_pa_filename existe déjà sous l'index de menu $catalog.'</p></font>";
		}
		
		$cur_pa_filename="$wwwroot$basedir/$pa_filename$extension";
		//echo "$cur_pa_filename<br>";
		if(file_exists($cur_pa_filename)) {
			$message = "<font color='red'><p>Attention ! Un fichier portant ce nom existe déjà.<br>" .
				"Voulez-vous écraser le script actuel sachant que toutes les modifications effectuées seront perdues ?</p></font>\n";
		} else
			$message = "<p>Voulez-vous enregistrer le script ?</p>\n";
		
		$script=make_code($userdb, $usertable, $pa_filename, $catalog, $indexfield, $secondfield, $A_fieldDefs, $cs, NO_FRAME);

		$file=fopen('tmp_code.php', "w");
		fwrite($file, $script);
		fclose($file);
		
		$script=make_page($userdb, $usertable, $pa_filename, $catalog, $indexfield, $secondfield, $A_sqlFields, $cs, NO_FRAME);

		$file=fopen('tmp_page.php', "w");
		fwrite($file, $script);
		fclose($file);
		
//		$script=make_single_script($userdb, $usertable, $pa_filename, $catalog, $indexfield, $secondfield, $A_sqlFields, $cs, NO_FRAME);
//
//		$file=fopen('tmp_single.php', "w");
//		fwrite($file, $script);
//		fclose($file);
//		
//		$script=make_browse_script($userdb, $usertable, $pa_filename, $catalog, $indexfield, $secondfield, $A_sqlFields, $cs, NO_FRAME);
//
//		$file=fopen('tmp_browse.php', "w");
//		fwrite($file, $script);
//		fclose($file);
//		
//		$script=make_form_script($userdb, $usertable, $pa_filename, $catalog, $indexfield, $secondfield, $A_sqlFields, $cs, NO_FRAME);
//
//		$file=fopen('tmp_form.php', "w");
//		fwrite($file, $script);
//		fclose($file);
//		
//		$script=make_insert_script($userdb, $usertable, $pa_filename, $catalog, $indexfield, $secondfield, $A_sqlFields, $cs, NO_FRAME);
//
//		$file=fopen('tmp_insert.php', "w");
//		fwrite($file, $script);
//		fclose($file);
//		
//		$script=make_update_script($userdb, $usertable, $pa_filename, $catalog, $indexfield, $secondfield, $A_sqlFields, $cs, NO_FRAME);
//
//		$file=fopen('tmp_update.php', "w");
//		fwrite($file, $script);
//		fclose($file);
//		
//		$script=make_delete_script($userdb, $usertable, $pa_filename, $catalog, $indexfield, $secondfield, $A_sqlFields, $cs, NO_FRAME);
//
//		$file=fopen('tmp_delete.php', "w");
//		fwrite($file, $script);
//		fclose($file);
		
		$hidden="";
		$hidden.="<input type='hidden' name='userdb' value='$userdb'>\n";
		$hidden.="<input type='hidden' name='usertable' value='$usertable'>\n";
		$hidden.="<input type='hidden' name='dbgrid' value='$dbgrid'>\n";
		$hidden.="<input type='hidden' name='menu' value='$menu'>\n";
		$hidden.="<input type='hidden' name='autogen' value='$autogen'>\n";
		$hidden.="<input type='hidden' name='filter' value='$filter'>\n";
		$hidden.="<input type='hidden' name='addoption' value='$addoption'>\n";
		$hidden.="<input type='hidden' name='me_id' value='$me_id'>\n";
		$hidden.="<input type='hidden' name='me_level' value='$me_level'>\n";
		$hidden.="<input type='hidden' name='bl_id' value='$bl_id'>\n";
		$hidden.="<input type='hidden' name='pa_filename' value='$pa_filename'>\n";
		$hidden.="<input type='hidden' name='extension' value='$extension'>\n";
		$hidden.="<input type='hidden' name='basedir' value='$basedir'>\n";
		$hidden.="<input type='hidden' name='query' value='$query'>\n";
		$hidden.="<input type='hidden' name='indexfield' value='$indexfield'>\n";
		$hidden.="<input type='hidden' name='secondfield' value='$secondfield'>\n";
		//$hidden.="<input type='hidden' name='pz_current_tab' value=''>\n";
		
		echo "<table cellpadding='0' cellspacing='0' border='0'>\n";
		echo "<tr><td>\n";
		echo "Script du code\n";
		echo "</td><td>\n";
		echo "<input type='button' value='Voir' onClick='window.open(\"source.php?file=tmp_code.php\")'>\n";
		echo "</td></tr>\n";
		echo "<tr><td>\n";
		echo "Script de la page\n";
		echo "</td><td>\n";
		echo "<input type='button' value='Voir' onClick='window.open(\"source.php?file=tmp_page.php\")'>\n";
		echo "</td></tr>\n";
//		echo "<tr><td>\n";
//		echo "Script tout en un\n";
//		echo "</td><td>\n";
//		echo "<input type='button' value='Voir' onClick='window.open(\"source.php?file=tmp_single.php\")'>\n";
//		echo "</td></tr>\n";
//		echo "<tr><td>\n";
//		echo "Script de la grille\n";
//		echo "</td><td>\n";
//		echo "<input type='button' value='Voir' onClick='window.open(\"source.php?file=tmp_browse.php\")'>\n";
//		echo "</td></tr>\n";
//		echo "<tr><td>\n";
//		echo "Script du formulaire\n";
//		echo "</td><td>\n";
//		echo "<input type='button' value='Voir' onClick='window.open(\"source.php?file=tmp_form.php\")'>\n";
//		echo "</td></tr>\n";
//		echo "<tr><td>\n";
//		echo "<tr><td>Script d'ajout\n";
//		echo "</td><td>\n";
//		echo "<input type='button' value='Voir' onClick='window.open(\"source.php?file=tmp_insert.php\")'>\n";
//		echo "</td></tr>\n";
//		echo "<tr><td>\n";
//		echo "<tr><td>Script de mise à jour\n";
//		echo "</td><td>\n";
//		echo "<input type='button' value='Voir' onClick='window.open(\"source.php?file=tmp_update.php\")'>\n";
//		echo "</td></tr>\n";
//		echo "<tr><td>\n";
//		echo "<tr><td>Script de suppression\n";
//		echo "</td><td>\n";
//		echo "<input type='button' value='Voir' onClick='window.open(\"source.php?file=tmp_delete.php\")'>\n";
//		echo "</td></tr>\n";
		echo "</table>\n";
		//$source=highlight_php($script, true);
		//echo "<p><input type='button' value='Tester le script tout en un' onClick='window.open(\"/$userdb/page.php?id=$catalog&lg=fr\")'></p>\n";
		
		echo $message;
		
		echo "<form name='myForm' method='POST' action='page.php?id=33&lg=$lg'>\n";
		echo $hidden;
		//echo "<div style='text-align:left;width:680px;height:500px;background:white;overflow:scroll'>$source</div><br>\n";
		
		echo "<input type='button' name='previous' value='<< Précédent' onClick='document.myForm.action=\"page.php?id=32&lg=$lg\";document.myForm.submit();'>\n";
		echo "<input type='submit' name='save' value='Oui'>\n";
		echo "<input type='submit' name='save' value='Non'>\n";
		echo "</form>\n";
	}
	
	if($save!="") {
		if($dbgrid=="0")
			$props="Grille";
		else
			$props="Grille + Fiche";
		if($filter=="1") $props.=" + Filtre";
		if($addoption=="1") $props.=" + Bouton Ajouter";

		if($me_id=="")
			$mindex="Auto-incrémenté";
		else
			$mindex=$me_id;
			
		if($save=="Oui") {
			$sstatus="Enregistré";
			copy('tmp_code.php', $wwwroot.$basedir . DIRECTORY_SEPARATOR . $catalog_pa_filename . '_code.php');
			unlink('tmp_code.php');
			copy('tmp_page.php', $wwwroot.$basedir . DIRECTORY_SEPARATOR . $catalog_pa_filename . '.php');
			unlink('tmp_page.php');
		} elseif($save=="Non") {
			$sstatus="Non-enregistré";
		}
	
		$mk_file="
		<fieldset style='width:450px;'>\n
		<legend>Récapitulatif des opérations</legend>
		<table border='0' bordercolor='0' width='85%' valign='top' style='display:hidden;'>\n
		<tr><td>\n
		<table border='0' cellspacing='0' cellpadding='0'>\n
		<tr><td><b>Base de données : </b></td><td>$userdb</td></tr>\n
		<tr><td><b>Table : </b></td><td>$usertable</td></tr>\n
		<tr><td><b>Propriétés du script : </b></td><td>$props</td></tr>\n
		<tr><td><b>Répertoire : </b></td><td>$wwwroot$basedir</td></tr>\n
		<tr><td><b>Nom du fichier : </b></td><td>$catalog_pa_filename</td></tr>\n
		<tr><td><b>Index du menu : </b></td><td>$mindex</td></tr>\n
		<tr><td><b>Niveau du menu : </b></td><td>$me_level</td></tr>\n
		<tr><td><b>Bloc du menu : </b></td><td>$bl_id</td></tr>\n
		<tr><td><b>Index de dictionaire : </b></td><td>$di_name</td></tr>\n
		<tr><td><b>Libellé court : </b></td><td>$di_fr_short</td></tr>\n
		<tr><td><b>Libellé long : </b></td><td>$di_fr_long</td></tr>\n
		<tr><td><b>L'index existait déjà : </b></td><td>$istatus</td></tr>\n
		<tr><td><b>Le script existait déjà : </b></td><td>$wstatus</td></tr>\n
		<tr><td><b>Etat du script : </b></td><td>$sstatus</td></tr>\n
		</table>\n
		</td></tr>\n
		<tr><td align='center'>\n
		<input type='submit' name='save' value='Terminer'>\n
		</td></tr>\n
		</table>\n
		</fieldset>\n
		";
		
		echo "<form name='myForm' method='POST' action='page.php?id=17&lg=$lg'>\n";
		echo $mk_file;
		echo "</form>\n";
		
	}
?>
</center>
