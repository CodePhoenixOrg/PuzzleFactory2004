<center>
<?php   
	include("db_code.php");
	if($query=="SELECT") {
			$sql="select db_id, db_name from db order by db_id";
			$dbgrid=create_pager_db_grid("db", $sql, $id, "page.php", "&query=ACTION$curl_pager", "", true, true, $dialog, array(0, 400), 15, $grid_colors, $cs);
			//$dbgrid=table_shadow("db", $dbgrid);
			echo "<br>".$dbgrid;
	} elseif($query=="ACTION") {
?>
<form method='POST' name='dbForm' action='page.php?id=34&lg=fr'>
	<input type='hidden' name='query' value='ACTION'>
	<input type='hidden' name='event' value='onRun'>
	<input type='hidden' name='pc' value='<?php   echo $pc?>'>
	<input type='hidden' name='sr' value='<?php   echo $sr?>'>
	<input type='hidden' name='db_id' value='<?php   echo $db_id?>'>
	<table border='1' bordercolor='<?php   echo $panel_colors["border_color"]?>' cellpadding='0' cellspacing='0' witdh='100%' height='1'>
		<tr>
			<td align='center' valign='top' bgcolor='<?php   echo $panel_colors["back_color"]?>'>
				<table>
				<tr>
					<td>db_id</td>
					<td>
						<?php   echo $db_id?>
					</td>
				</tr>
				<tr>
					<td>db_name</td>
					<td>
						<input type='text' name='db_name' value='<?php   echo $db_name?>'>
					</td>
				</tr>
				<tr>
					<td>db_server</td>
					<td>
						<input type='text' name='db_server' value='<?php   echo $db_server?>'>
					</td>
				</tr>
				<tr>
					<td>db_site</td>
					<td>
						<input type='text' name='db_site' value='<?php   echo $db_site?>'>
					</td>
				</tr>
					<tr>
						<td align='center' colspan='2'>
							<input type='submit' name='action' value='<?php   echo $action?>'>
							<?php   if($action!="Ajouter") { ?>
								<input type='submit' name='action' value='Supprimer'>
							<?php   } ?>
							<input type='reset' name='action' value='Annuler'>
							<input type='submit' name='action' value='Retour'>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</form>
<?php   	} ?>
</center>
