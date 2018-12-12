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

include_once("ipz_misc.php");
include_once("ipz_mysqlconn.php");
include_once("ipz_db_pieces.php");

define("BUTTON_OUT", "out");
define("BUTTON_OVER", "over");
define("BUTTON_DOWN", "down");
define("BUTTON_UP", "up");
define("BUTTON_IMAGE", "img");
define("BUTTON_INPUT", "input");
define("BUTTON_IMAGE_RESET", "img_reset");
define("BUTTON_INPUT_RESET", "input_reset");
define("SUB_MENU_HORIZONTAL", 0);
define("SUB_MENU_VERTICAL", 1);

function get_admin_url($database) {
	$adm_url="";
	$cs=connection("connect", $database);
	$sql="select app_link from applications where di_name='modadmin'";
	$result=mysql_query($sql, $cs);
	if($rows=mysql_fetch_array($result)) $adm_url=$rows["app_link"];
	
	return $adm_url;
}
		
function show_menu($database="") {

	$cs=connection("connect", $database);
	
	$sql = 'delete from v_menus;';
	mysql_query($sql, $cs);

	$sql=   "insert into v_menus (me_id, pa_id, me_level, di_name, me_target, pa_filename, di_fr_short, di_fr_long, di_en_short, di_en_long)".
		"select m.me_id, m.pa_id, m.me_level, m.di_name, m.me_target, p.pa_filename, d.di_fr_short, d.di_fr_long, d.di_en_short, d.di_en_long " .
                "from menus m, pages p, dictionary d " .
                "where m.di_name = d.di_name " .
                "and p.di_name = d.di_name " .
                "order by m.me_id";
		//echo $sql;
	mysql_query($sql, $cs);

	$sql=   "select me_id as Menu, pa_id as Page, me_level as Niveau, di_name as Dictionnaire, me_target as Cible, pa_filename as Fichier, di_fr_short as 'Francais court', di_fr_long as 'Francais long', di_en_short as 'Anglais court', di_en_long as 'Anglais long' from v_menus";
	
        //tableau_sql("menu", $sql, 0, "edit.php", "", "&database=$database", "", "", "", $cs);
	//container("menu", 50, 250, 200, 355, 16);
	$dbgrid=create_db_grid("menu", $sql, "editor", "page.php", "&me_id=#Menu&userdb=$database", false, $dialog, array(), $grid_colors, $cs);
	echo $dbgrid;

}

function menu_exists($database="", $pa_filename="") {
        $cs=connection("connect", $database);
	
	$sql=	"select m.me_id, m.pa_id, m.me_level, m.di_name, m.me_target, p.pa_filename, d.di_fr_short, d.di_fr_long, d.di_en_short, d.di_en_long " .
                "from menus m, pages p, dictionary d " .
                "where m.di_name = d.di_name " .
                "and p.di_name = d.di_name " .
		"and p.pa_filename = '$pa_filename' " .
                "order by m.me_id";
	
	$result=mysql_query($sql, $cs);
	$exists=MYSQL_NUM_rows($result)>0;
	
	return $exists;
}

function get_menu_id($database="", $pa_filename) {
	$cs=connection(CONNECT, $database);
	$sql="SELECT me_id from menus inner join pages on menus.pa_id = pages.pa_id where pages.pa_filename = '$pa_filename'";
	//echo "sql: '$sql';<br>";
	$result=mysql_query($sql, $cs);
	$rows=mysql_fetch_array($result);
	$menu_id=$rows[0];

	return $menu_id;
}

function get_menu_id_ac($cs="", $pa_filename) {
	$sql="select m.me_id ";
	$sql.="from menus m, pages p ";
	$sql.="where p.pa_filename='$pa_filename' and m.pa_id=p.pa_id";
	$result=mysql_query($sql, $cs);
	$rows=mysql_fetch_array($result);
	$menu_id=$rows[0];

	return $menu_id;
}

function get_next_menu_id($database="") {
	$cs=connection("connect", $database);
	$sql="select max(me_id)+1 from menus";
	$result=mysql_query($sql, $cs);
	$rows=mysql_fetch_array($result);
	$menu_id=$rows[0];

	return $menu_id;
}

function get_page_filename($database="", $id=0) {
        $sql=   "select p.pa_filename " .
                "from pages p, menus m, dictionary d " .
                "where m.di_name=d.di_name " .
                "and p.pa_id=m.me_id " .
                "and m.me_id=" . $id;
        $cs=connection("connect", $database);
        $result=mysql_query($sql);
        $rows=mysql_fetch_array($result);
        $page = $rows[0];
        
	return $page;
}
		
function add_menu(
	$database="",
	$me_id=0, $di_name="", $me_level="", $me_target="", 
	$pa_id=0, $new_pa_id=0, $pa_filename="", 
	$di_fr_short="", $di_fr_long="", $di_en_short="", $di_en_long=""
) {
  	if(!menu_exists($pa_filename)) {
		$cs=connection("connect", $database);
		$wwwroot=get_www_root();
		
		if(empty($me_id)) {
			$sql="select max(me_id) from menus";
			$result=mysql_query($sql, $cs);
			$rows=mysql_fetch_array($result);
			$me_id=$rows[0]+1;
		}
		
		//if(empty($me_level)) $me_level="1";
		if(empty($me_target)) $me_target="page";
		if(empty($pa_id)) $pa_id=$me_id;

		if(empty($new_pa_id)) {
			$sql="select max(pa_id) from pages";
			$result=mysql_query($sql, $cs);
			$rows=mysql_fetch_array($result);
			$new_pa_id=$rows[0]+1;
		}
		
		$sql=   "insert into menus (me_id, di_name, me_level, me_target, pa_id) " .
			"values($me_id, '$di_name', '$me_level', '$me_target', $pa_id)";
		$result=mysql_query($sql, $cs);
		
		$sql=   "insert into pages (pa_id, di_name, pa_filename) " .
			"values($new_pa_id, '$di_name', '$pa_filename')" ;
		$result=mysql_query($sql, $cs);
		
		$sql=   "insert into dictionary (di_name, di_fr_short, di_fr_long, di_en_short, di_en_long) " .
			"values('$di_name', '$di_fr_short', '$di_fr_long', '$di_en_short', '$di_en_long')";
		$result=mysql_query($sql, $cs);

		//copy("$wwwroot/$database/includes/fichier_vide.php", "fr/$pa_filename");
		//copy("$wwwroot/$database/includes/fichier_vide.php", "en/$pa_filename");
	}
	return $me_id;
}

function update_menu(
	$database,
	$me_id, $di_name, $me_level, $me_target, 
	$pa_id, $new_pa_id, $pa_filename, 
	$di_fr_short, $di_fr_long, $di_en_short, $di_en_long
) {
        $cs=connection("connect", $database);
	$sql=   "update menus set di_name='$di_name', me_level='$me_level', me_target='$me_target', pa_id=$pa_id ".
		"where me_id=$me_id";
	$result=mysql_query($sql, $cs);
	$sql=   "update pages set di_name='$di_name', pa_filename='$pa_filename'".
		"where pa_id=$pa_id";
	$result=mysql_query($sql, $cs);
	$sql=   "update menus set di_fr_short='$di_fr_short', di_fr_long='$di_fr_long', di_en_short='$di_en_short', di_en_long='$di_en_long' where di_name=$di_name";
	$result=mysql_query($sql, $cs);
}

function delete_menu($database="", $di_name) {
        $cs=connection("connect", $database);
	$sql="delete from menus where di_name='$di_name'";
	$result=mysql_query($sql, $cs);
	$sql="delete from pages where di_name='$di_name'";
	$result=mysql_query($sql, $cs);
	$sql="delete from dictionary where di_name='$di_name'";
	$result=mysql_query($sql, $cs);
}

function make_button_image($text="", $style="", $hl_color="") {
	$images_dir=get_local_images_dir();
	$filename=$images_dir.$text."_".$style.".png";

	if(!file_exists($filename)) {
		$size=10;
		$offset=-16;
		$fonts_dir=get_local_fonts_dir();
		$font=$fonts_dir."tahoma.ttf";

		if(!empty($hl_color)) {
			$red=hexdec(substr($hl_color,0,2));
	              	$green=hexdec(substr($hl_color,2,2));
	               	$blue=hexdec(substr($hl_color,4,2));
		} else {
			$red=255;
			$green=255;
			$blue=255;
		}

		if($style==BUTTON_UP
		|| $style==BUTTON_OUT 
		|| $style==BUTTON_OVER) {
			$offsetX=-2;
			$offsetY=-2;
			$position=BUTTON_UP;
		} else if ($style==BUTTON_DOWN) {
			$offsetX=0;
			$offsetY=0;
			$position=BUTTON_DOWN;
		}
		
		list($llx,$lly,$lrx,$lry,$urx,$ury,$ulx,$uly)=imageTTFbbox($size,0,$font,$text); 

		$fwidth=abs($llx)+$lrx;
		$fheight=abs($uly-$lly);
	
		$im=imagecreate($fwidth+$offset+24,24);
		$blue_bg=ImageColorAllocate($im, 0, 0, 255);
		imagecolortransparent($im, $blue_bg);
	
 		$src_im = imagecreatefrompng($images_dir."builds/button_".$position."_left.png");
		imagecopy($im, $src_im, 0,0,0,0,12,24);
		imagedestroy($src_im);

	 	$src_im = imagecreatefrompng($images_dir."builds/button_".$position."_middle.png");
		imagecopy($im, $src_im, 12,0,0,0,$fwidth+$offset,24);
		imagedestroy($src_im);
	
	 	$src_im = imagecreatefrompng($images_dir."builds/button_".$position."_right.png");
		imagecopy($im, $src_im, $fwidth+$offset+12,0,0,0,12,24);
		imagedestroy($src_im);

	
		$width=imagesx($im);
		$height=imagesy($im);
		$shadow_color= ImageColorAllocate($im, 0, 0, 0); 
		$fore_color=ImageColorAllocate($im, $red, $green, $blue);
		$values="($red, $green, $blue)";

		$left=abs(($width-$fwidth)/2)+abs($llx)+$offsetX;
		$top=abs(($height-$fheight)/2)+$fheight-$lly+$offsetY;
		//$top=abs(($height-$fheight)/2)+abs($uly);
		
		imagettftext($im,$size,0,$left,$top,$shadow_color,$font,$text); 
		imagettftext($im,$size,0,$left+1,$top+1,$fore_color,$font,$text); 
		imagepng($im, $filename, 255);
		//passthru("convert $filename.png $filename.gif"); 
		imagedestroy($im);
	}

	return $values;
}

function make_button_code($text="", $type="", $out_color="", $over_color="", $down_color="") {
	$values=make_button_image($text, BUTTON_OUT, $out_color);
	$values=make_button_image($text, BUTTON_OVER, $over_color);
	$values=make_button_image($text, BUTTON_DOWN, $down_color);
	$images_dir=get_http_images_dir();

	if($type==BUTTON_IMAGE || $type==BUTTON_IMAGE_RESET)
		$button="<img\n";
	else if($type==BUTTON_INPUT || $type==BUTTON_INPUT_RESET)
		$button="<input type=\"image\" name=\"$text\" value=\"$text\"\n";
	
	$button.="\tid=\"$text\"\n";
	$button.="\tsrc=\"".$images_dir.$text."_out.png\"\n";
	$button.="\tonMouseOut=\"PZ_IMG.src='".$images_dir.$text."_out.png';\"\n";
	$button.="\tonMouseOver=\"PZ_IMG=document.getElementById('$text'); PZ_IMG.src='".$images_dir.$text."_over.png';\"\n";
	$button.="\tonMouseDown=\"PZ_IMG.src='".$images_dir.$text."_down.png';\"\n";
	if($type==BUTTON_IMAGE || $type==BUTTON_INPUT)
		$button.="\tonMouseUp=\"PZ_IMG.src='".$images_dir.$text."_over.png';\"\n";
	else if($type==BUTTON_IMAGE_RESET || $type==BUTTON_INPUT_RESET)
		$button.="\tonMouseUp=\"PZ_IMG.src='".$images_dir.$text."_over.png'; document.myForm.reset();\"\n";
	$button.=">\n";

	return $button;
}

function create_main_menu($database="", $level=0) {
	global $lg, $db_prefix;
	//$lg=get_variable("lg");
	
        $main_menu="<table border='0' cellpading='0' cellspacing='0'><tr>";
        $sql="";
        $sql=   "select m.pa_id, m.me_level, d.di_" . $lg . "_short " .
                "from ${db_prefix}menus m,  ${db_prefix}dictionary d " .
                "where m.di_name=d.di_name " .
                "and m.me_level='$level' " .
                "order by m.me_id";
		
//		echo $sql . "<br>";                
		
        $cs=connection("connect", $database);
        $result=mysql_query($sql, $cs);
		$count=0;
        while($rows=mysql_fetch_array($result, MYSQL_NUM)) {
		
                $index=$rows[0];
                $level=$rows[1];
                $caption=$rows[2];
                //$target=$rows[3];
                //$link=$rows[4];
		
                #$main_menu=$main_menu . "<td bgcolor='black'><a href='page.php?id=$index&lg=" . $lg . "'><font color='#ffffff'><b>$caption</b></font></a><font color='#ffffff'><b>&nbsp;|&nbsp;</b></font></td>";
                $main_menu=$main_menu . "<td><a href='page.php?id=$index&lg=" . $lg . "'><font color='#ffffff'><b>$caption</b></font></a><font color='#ffffff'><b>&nbsp;|&nbsp;</b></font></td>";
		
		if($count==0) $default_id=$index;
		$count++;
        }
	$main_menu=substr($main_menu, 0, strlen($main_menu)-23);
	$main_menu.="</tr></table>";
	
        mysql_free_result($result);

        return array("index"=>$default_id, "menu"=>$main_menu);
};

function create_framed_main_menu($database="", $color, $text_color, $over_color, $width, $height, $lg="") {
	global $db_prefix;
	
        $main_menu="";
        $sql="";
        $sql=   "select m.pa_id, m.me_level, d.di_" . $lg . "_short, m.me_target, p.pa_filename " .
                "from  ${db_prefix}menus m,  ${db_prefix}pages p,  ${db_prefix}dictionary d " .
                "where m.me_level=1 " .
                "and m.pa_id=p.pa_id " .
                "and m.di_name=d.di_name " .
                "order by m.me_id";
        $cs=connection("connect", $database);
        $result=mysql_query($sql, $cs);
        while($rows=mysql_fetch_array($result)) {
                $index=$rows[0];
                $level=$rows[1];
                $caption=$rows[2];
                $target=$rows[3];
                $link=$rows[4];
		$main_menu.="<applet code=\"fphover.class\" codebase=\"/$database/java/\" width=\"$width\" height=\"$height\">\n";
		$main_menu.="\t<param name=\"textcolor\" value=\"$text_color\">\n";
		$main_menu.="\t<param name=\"text\" value=\"$caption\">\n";
		$main_menu.="\t<param name=\"color\" value=\"$color\">\n";
		$main_menu.="\t<param name=\"hovercolor\" value=\"$over_color\">\n";
		$main_menu.="\t<param name=\"effect\" value=\"glow\">\n";
		$main_menu.="\t<param name=\"target\" value=\"page\">\n";
		$main_menu.="\t<param name=\"url\" valuetype=\"ref\" value=\"$lg/$link?lg=$lg\">\n";
		$main_menu.="</applet>\n\n";
        }
        mysql_free_result($result);
        return $main_menu;
};

function create_sub_menu($database="", $id=0, $lg="", $orientation) {
	global $db_prefix;

	if ($orientation==SUB_MENU_HORIZONTAL)
		$sub_menu="";
	else if($orientation==SUB_MENU_VERTICAL)
		$sub_menu="<table width='100%'>";
	
        $sql=	"select m.me_id, m.me_level, d.di_" . $lg . "_short, m.me_target, p.pa_filename, p.pa_id " .
                "from  ${db_prefix}menus m,  ${db_prefix}pages p,  ${db_prefix}dictionary d " .
                "where m.di_name=d.di_name " .
                "and p.pa_id=m.pa_id " .
                "and m.me_id<>m.pa_id " .
                "and m.me_level>1 " .
                "and m.pa_id=" . $id;
                //and m.me_id<>m.pa_id

        $cs=connection("connect", $database);
        $result=mysql_query($sql);
        while($rows=mysql_fetch_array($result))        {
                $index=$rows[0];
                $level=$rows[1];
                $caption=$rows[2];
                $target=$rows[3];
                $link=$rows[4];
		$page=$rows[5];
		if ($orientation==SUB_MENU_HORIZONTAL) {
			switch ($level) {
			case "2":
	                        $sub_menu.="<a href='page.php?id=$index&lg=" . $lg . "'><font color='#FFFFFF'>$caption</font></a><font color='#FFFFFF'>&nbsp;|&nbsp;</font>";
				break;
			case "3":
	                        $sub_menu.="<a href='$target?id=$index&lg=" . $lg . "'><font color='#FFFFFF'>$caption</font></a><font color='#FFFFFF'>&nbsp;|&nbsp;</font>";
				break;
			case "4":
	                        $sub_menu.="<a href='page.php?id=$page&lg=" . $lg . "#$target'><font color='#FFFFFF'>$caption</font></a><font color='#FFFFFF'>&nbsp;|&nbsp;</font>";
	                        //$sub_menu.="<a href='$PHP_SELF#$target'><font color='#FFFFFF'>$caption</font></a><font color='#FFFFFF'>&nbsp;|&nbsp;</font>";
				break;
	                }
		} else if($orientation==SUB_MENU_VERTICAL) {
			
			switch ($level) {
			case "2":
	                        $sub_menu.="<tr><td><a href='page.php?id=$index&lg=" . $lg . "'>$caption</a></td></tr>";
				break;
			case "3":
	                        $sub_menu.="<tr><td><a href='$target?id=$index&lg=" . $lg . "'>$caption</a></td></tr>";
				break;
			case "4":
	                        $sub_menu.="<tr><td><a href='page.php?id=$page&lg=" . $lg . "#$target'>$caption</a></td></tr>";
				break;
			case "5":
                	        $sub_menu.="<tr><td>&nbsp;&nbsp;&nbsp;<a href='page.php?id=$page&lg=" . $lg . "#$target'>$caption</a></td></tr>";
			case "6":
	                        $sub_menu.="<tr><td><a href='$link' target='_new'>$caption</a></td></tr>";
				break;
	                }
		}
        }
	if ($orientation==SUB_MENU_HORIZONTAL)
		$sub_menu=substr($sub_menu, 0, strlen($sub_menu)-14);
	else if($orientation==SUB_MENU_VERTICAL)
		$sub_menu.="</table>";
        mysql_free_result($result);
        return $sub_menu;
};

function create_menu_tree($database="", $id=0, $lg="", $orientation) {
	global  $db_prefix;

	if ($orientation==SUB_MENU_HORIZONTAL)
		$sub_menu="";
	else if($orientation==SUB_MENU_VERTICAL)
		$sub_menu="<table width='100%'>";

        $sql=   "select m.me_id, m.me_level, d.di_" . $lg . "_short, m.me_target, p.pa_filename, p.pa_id " .
                "from  ${db_prefix}menus m,  ${db_prefix}pages p,  ${db_prefix}dictionary d " .
                "where m.me_level>1 " .
                "and m.pa_id=p.pa_id " .
                "and m.di_name=d.di_name " .
                "and m.me_id=" . $id . " " .
		"order by p.pa_id, m.me_level";

		//echo "$sql<br>";

        $cs=connection("connect", $database);
        $result=mysql_query($sql);
        while($rows=mysql_fetch_array($result))        {
		$page=$rows[5];
	}
	if (!empty($page)) {
		if ($page!=$id) $id=$page;
	}
		
        $sql=   "select m.me_id, m.me_level, d.di_" . $lg . "_short, m.me_target, p.pa_filename, p.pa_id " .
                "from menus m, pages p, dictionary d " .
                "where m.me_level=1 " .
                "and m.pa_id=p.pa_id " .
                "and m.di_name=d.di_name " .
		"union " .
        	"select m.me_id, m.me_level, d.di_" . $lg . "_short, m.me_target, p.pa_filename, p.pa_id " .
                "from menus m, pages p, dictionary d " .
                "where m.di_name=d.di_name " .
                "and m.me_id<>m.pa_id " .
                "and p.pa_id=m.pa_id " .
                "and m.pa_id=" . $id . " " .
		"order by p.pa_id, m.me_level";
		
	//echo "$sql<br>";

        $result=mysql_query($sql);
        while($rows=mysql_fetch_array($result))        {
                $index=$rows[0];
                $level=$rows[1];
                $caption=$rows[2];
                $target=$rows[3];
                $link=$rows[4];
		$page=$rows[5];
		if ($orientation==SUB_MENU_HORIZONTAL) {
			switch ($level) {
			case "1":
	                        $sub_menu.="<a href='page.php?id=$index&lg=" . $lg . "'><font color='#FFFFFF'>$caption</font></a><font color='#FFFFFF'>&nbsp;|&nbsp;</font>";
				break;
			case "2":
	                        $sub_menu.="<a href='page.php?id=$index&lg=" . $lg . "'><font color='#FFFFFF'>$caption</font></a><font color='#FFFFFF'>&nbsp;|&nbsp;</font>";
				break;
			case "3":
	                        $sub_menu.="<a href='$target?id=$index&lg=" . $lg . "'><font color='#FFFFFF'>$caption</font></a><font color='#FFFFFF'>&nbsp;|&nbsp;</font>";
				break;
			case "4":
	                        $sub_menu.="<a href='page.php?id=$page&lg=" . $lg . "#$target'><font color='#FFFFFF'>$caption</font></a><font color='#FFFFFF'>&nbsp;|&nbsp;</font>";
	                        //$sub_menu.="<a href='$PHP_SELF#$target'><font color='#FFFFFF'>$caption</font></a><font color='#FFFFFF'>&nbsp;|&nbsp;</font>";
				break;
	                }
		} else if($orientation==SUB_MENU_VERTICAL) {
			
			switch ($level) {
			case "1":
	                        $sub_menu.="<tr><td><a href='page.php?id=$index&lg=" . $lg . "'>$caption</a></td></tr>";
				break;
			case "2":
	                        $sub_menu.="<tr><td>&nbsp;&nbsp;<a href='page.php?id=$index&lg=" . $lg . "'>$caption</a></td></tr>";
				break;
			case "3":
	                        $sub_menu.="<tr><td>&nbsp;&nbsp;<a href='$target?id=$index&lg=" . $lg . "'>$caption</a></td></tr>";
				break;
			case "4":
	                        $sub_menu.="<tr><td>&nbsp;&nbsp;<a href='page.php?id=$page&lg=" . $lg . "#$target'>$caption</a></td></tr>";
				break;
			case "5":
                	        $sub_menu.="<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;<a href='page.php?id=$page&lg=" . $lg . "#$target'>$caption</a></td></tr>";
			case "6":
	                        $sub_menu.="<tr><td>&nbsp;&nbsp;<a href='$link' target='_new'>$caption</a></td></tr>";
				break;
	                }
		}
        }
	if ($orientation==SUB_MENU_HORIZONTAL)
		$sub_menu=substr($sub_menu, 0, strlen($sub_menu)-14);
	else if($orientation==SUB_MENU_VERTICAL)
		$sub_menu.="</table>";
        mysql_free_result($result);
        return $sub_menu;
};

function retrieve_page_by_menu_id($database="", $id=0, $lg="") {
	global  $db_prefix;

        $title="";
        $page="";
        $sql = "";
        $sql=   "select d.di_name, p.pa_filename, m.me_charset, d.di_" . $lg . "_short, d.di_" . $lg . "_long " .
                "from  ${db_prefix}pages p,  ${db_prefix}menus m,  ${db_prefix}dictionary d " .
                "where m.di_name=d.di_name " .
                "and p.di_name=m.di_name " .
                "and m.me_id=$id";
                
//        echo $sql . "<br>";
                //"and p.pa_id=m.me_id " .
        $cs=connection("connect", $database);
        $result=mysql_query($sql, $cs);
        $rows=mysql_fetch_array($result);
		$index = $rows["di_name"];
        $page = $rows["pa_filename"];
        $title = $rows["di_".$lg."_long"];
		$charset = $rows["me_charset"];
        if($title=="") $title = $rows["di_".$lg."_short"];
	
	$request="";
	$p=strpos($page, "?", 0);
	if($p>-1) {
		$request="&".substr($page, $p+1, strlen($page)-$p);
		$page=substr($page, 0, $p);
	}
	
        $title_page=array("index"=>$index, "title"=>$title, "page"=>$page, "request"=>$request, "charset"=>$charset);

	/*
	$filename=$lg."/".$page;
	
	if (!file_exists($filename)) {
		copy("includes/fichier_vide.php", $filename);
	}
	*/
        return $title_page;
}

function retrieve_page_by_dictionary_id($database="", $di="", $lg="") {
	global $db_prefix;
	
        $title="";
        $page="";
        $sql = "";
        $sql=   "select m.me_id, p.pa_filename, d.di_" . $lg . "_short, d.di_" . $lg . "_long " .
                "from  ${db_prefix}pages p,  ${db_prefix}menus m,  ${db_prefix}dictionary d " .
                "where m.di_name=d.di_name " .
                "and p.di_name=m.di_name ".
                "and d.di_name='$di'";
        echo $sql . "<br>";

        $cs=connection("connect", $database);
        $result=mysql_query($sql, $cs);
        $rows=mysql_fetch_array($result);
		$index = $rows["me_id"];
        $page = $rows["pa_filename"];
        $charset = $rows["me_charset"];
        $title = $rows["di_".$lg."_long"];
        if($title=="") $title = $rows["di_".$lg."_short"];

	$request="";
	$p=strpos($page, "?", 0);
	if($p>-1) {
		$request="&".substr($page, $p+1, strlen($page)-$p);
		$page=substr($page, 0, $p);
	}
	
        $title_page=array("index"=>$index, "title"=>$title, "page"=>$page, "request"=>$request, "charset"=>$charset);
        
	return $title_page;
}

?>
