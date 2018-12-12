<center>
<?php   
	include_once 'changelog_code.php';
	if($query=="SELECT") {
		//$sql="select cl_id, cl_title from changelog order by cl_id";
		$sql="select cl_id, concat('<b>', cl_title, '</b><br>', cl_text, '<br>') as changements, cl_date as Date from changelog order by cl_date desc, cl_time desc";
		$dbgrid=create_pager_db_grid("changelog", $sql, $id, "page.php", "&query=ACTION$curl_pager", "", true, true, $dialog, array(0, 450), 15, $grid_colors, $cs);
		//$dbgrid=table_shadow("changelog", $dbgrid);
		echo "<br>".$dbgrid;
	} elseif($query=="ACTION") {
?>
<form method='POST' name='changelogForm' action='page.php?id=24&lg=fr'>
	<input type='hidden' name='query' value='ACTION'>
	<input type='hidden' name='event' value='onRun'>
	<input type='hidden' name='pc' value='<?php    echo $pc?>'>
	<input type='hidden' name='sr' value='<?php    echo $sr?>'>
	<input type='hidden' name='cl_id' value='<?php    echo $cl_id?>'>
	<table border='1' bordercolor='<?php    echo $panel_colors["border_color"]?>' cellpadding='0' cellspacing='0' witdh='100%' height='1'>
		<tr>
			<td align='center' valign='top' bgcolor='<?php    echo $panel_colors["back_color"]?>'>
				<table>
					<tr>
						<td>Rapport n°</td>
						<td>
							<?php    echo $cl_id?>
						</td>
					</tr>
					<tr>
						<td>Date</td>
						<td>
							<input type='text' name='cl_date' value='<?php   echo date('d/m/Y');?>' size='19' readonly>
                                                        
						</td>
					</tr>
					<tr>
						<td>Rapporté par</td>
						<td>
							<select name='mbr_id'>
							<?php    $sql='select mbr_id, mbr_nom from members order by mbr_nom';
							$options=create_options_from_query($sql, 0, 1, array(), $mbr_id, false, $cs);
							echo $options["list"];?>
							</select>
						</td>
					</tr>
					<tr>
						<td>Intitulé</td>
						<td>
							<input type='text' name='cl_title' value='<?php    echo $cl_title?>' size='80'>
						</td>
					</tr>
					<tr>
						<td>Description</td>
						<td>
							<textarea name='cl_text' cols='80' rows='5'><?php    echo $cl_text?></textarea><br>
							* Les tags HTML peuvent être utilisés pour formater le texte.
						</td>
					</tr>
					<tr>
						<td>Forum</td>
						<td>
							<select name='fr_id'>
							<?php    $sql='select fr_id, fr_title from forums order by fr_title';
							$options=create_options_from_query($sql, 0, 1, array(), $fr_id, false, $cs);
							echo $options["list"];?>
							</select>
						</td>
					</tr>
					<tr>
						<td align='center' colspan='2'>
							<input type='submit' name='action' value='<?php    echo $action?>'>
							<?php    if($action!="Ajouter") { ?>
								<input type='submit' name='action' value='Supprimer'>
							<?php    } ?>
							<input type='reset' name='action' value='Annuler'>
							<input type='submit' name='action' value='Retour'>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</form>
<?php    	} ?>
</center>
