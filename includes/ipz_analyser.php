<?php   
/*
iPuzzle.WebPieces
Copyright (C) 2004 David Blanchard

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
*/

function relations($database, $table, $cs) {
	$L_formFields="";
	$A_formFields=array();
	$L_fieldDefs="";
	$A_fieldDefs=array();
	$L_tables="";
	$A_tables=array();
	$L_fields="";
	$A_fields=array();
	
	$i=0;
	$sql="select * from $table limit 0,1;";
	$result = mysql_query($sql, $cs);
	$rows=mysql_fetch_array($result);
	//$k=sizeof($rows)/2;
	$k=mysql_num_fields($result);
	while($i<$k) {
		$fieldname=mysql_field_name($result, $i);
		$fieldsize=mysql_field_len($result, $i);
		$fieldtype=mysql_field_type($result, $i);
		
		$cols=($fieldsize>80) ? 80: $fieldsize;
		$lines=($fieldtype=="blob" || ($fieldtype=="string" && $fieldsize > 255)) ? 5: 1;
		
		//echo "fieldname='$fieldname'<br>";
		
		if($i==0) {
			$indexfield=$fieldname;
			$p=strpos($indexfield, "_");
			$table_prefix=substr($indexfield, 0, $p);
		}
		$p=strpos($fieldname, "_");
		$current_prefix=substr($fieldname, 0, $p);
		if($table_prefix!=$current_prefix) {
			$fieldFound=false;
			$EOL=$fieldFound;
			while(!$fieldFound && !$EOL) {
				$sql="show tables from $database;";
				//echo "SQL: $sql<br>";
				$tab_res=mysql_query($sql, $cs);
				$fieldTable="";
				while(($tables=mysql_fetch_array($tab_res)) && ($fieldTable=="")) {
					$currentTable=$tables[0];
					$sql="show fields from $currentTable;";
					//echo "\tSQL: $sql<br>";
					$fld_res=mysql_query($sql, $cs);
					$fields=mysql_fetch_array($fld_res);
					//echo "\t\tField: ".$fields[0]."==$fieldname=";
					if($fieldname==$fields[0]) {
						$fieldTable=$currentTable;
						$L_tables.="$fieldTable;";
					}
					$fieldFound=($fieldname==$fields[0]); // || $fieldFound;
					//echo "$fieldFound<br>";
				}
				$EOL=true;
			}
			if($fieldFound) {
				$sql="show fields from $fieldTable";
				//echo "SQL: $sql<br>";
				$fld_res=mysql_query($sql, $cs);
				$j=0;
				while(($fields=mysql_fetch_array($fld_res)) && $j<2) {
					if($j==0) $frn_idfield=$fields[0];
					if($j==1) $frn_firstfield=$fields[0];
					$j++;
				}
				$options="\t\t\t\t\t\t<?php   \$sql='select $frn_idfield, $frn_firstfield from $currentTable order by $frn_firstfield';\n";
				$options.="\t\t\t\t\t\t\$options=create_options_from_query(\$sql, 0, 1, array(), $$frn_idfield, false, \$cs);\n";
 				$options.="\t\t\t\t\t\techo \$options[\"list\"];?>\n";
				$L_fields.="$frn_idfield;";
				$L_formFields.="\t\t\t\t<tr>\n" .
						"\t\t\t\t\t<td>$fieldname</td>\n" .
						"\t\t\t\t\t<td>\n" .
						"\t\t\t\t\t\t<select name='$frn_idfield'>\n" .
						"$options" .
						"\t\t\t\t\t\t</select>\n" .
						"\t\t\t\t\t</td>\n" .
						"\t\t\t\t</tr>§";
				$L_fieldDefs.="$fieldname,$fieldsize,$fieldtype,SELECT,$cols,8;";
			}
		} else {
			$L_fields.="$fieldname;";
			if($fieldname==$indexfield) {
				$L_formFields.="\t\t\t\t<tr>\n";
				$L_formFields.="\t\t\t\t\t<td>$fieldname</td>\n";
				$L_formFields.="\t\t\t\t\t<td>\n";
				$L_formFields.="\t\t\t\t\t\t<?php   echo $$fieldname?>\n";
				$L_formFields.="\t\t\t\t\t</td>\n";
				$L_formFields.="\t\t\t\t</tr>§";
				/*$L_formFields.="<tr><td>$fieldname</td>\n<td><?php   echo $$fieldname?></td></tr>\n§";*/
				$L_fieldDefs.="$fieldname,$fieldsize,$fieldtype,LABEL,$cols,$lines;";
			} else {
				//echo "Fields: ".$L_formfields;
				
				if($fieldtype=="blob" || ($fieldtype=="string" && $fieldsize > 255)) {
					$L_formFields.="\t\t\t\t<tr>\n";
					$L_formFields.="\t\t\t\t\t<td>$fieldname</td>\n";
					$L_formFields.="\t\t\t\t\t<td>\n";
					$L_formFields.="\t\t\t\t\t\t<textarea name='$fieldname' cols='80' rows='5'><?php   echo $$fieldname?></textarea>\n";
					$L_formFields.="\t\t\t\t\t</td>\n";
					$L_formFields.="\t\t\t\t</tr>§";
					$L_fieldDefs.="$fieldname,$fieldsize,$fieldtype,TEXTAREA,$cols,$lines;";
				} else {
					$L_formFields.="\t\t\t\t<tr>\n";
					$L_formFields.="\t\t\t\t\t<td>$fieldname</td>\n";
					$L_formFields.="\t\t\t\t\t<td>\n";
					$L_formFields.="\t\t\t\t\t\t<input type='text' name='$fieldname' value='<?php   echo $$fieldname?>'>\n";
					$L_formFields.="\t\t\t\t\t</td>\n";
					$L_formFields.="\t\t\t\t</tr>§";
					/* $L_formFields.="<tr><td>$fieldname</td>\n<td><input type='text' name='$fieldname' value='<?php   echo $$fieldname?>'></td></tr>\n§"; */
					$L_fieldDefs.="$fieldname,$fieldsize,$fieldtype,TEXT,$cols,$lines;";
				}
			}
		}
		$i++;
	}

	$A_tables=explode(";", $L_tables);
	$A_fields=explode(";", $L_fields);
	$A_formFields=explode("§", $L_formFields);
	$A_fieldDefs=explode(";", $L_fieldDefs);
	array_pop($A_tables);
	array_pop($A_fields);
	array_pop($A_formFields);
	array_pop($A_fieldDefs);

	return array("relation_tables"=>$A_tables, "relation_fields"=>$A_fields, "form_fields"=>$A_formFields, "field_defs"=>$A_fieldDefs);
}
?>	
