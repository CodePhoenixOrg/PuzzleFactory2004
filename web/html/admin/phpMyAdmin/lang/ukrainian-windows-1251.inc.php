<?php
/* $Id: ukrainian-windows-1251.inc.php,v 2.2 2003/11/20 13:48:53 nijel Exp $ */

$charset = 'windows-1251';
$text_dir = 'ltr';
$left_font_family = 'verdana, arial, helvetica, geneva, sans-serif';
$right_font_family = 'arial, helvetica, geneva, sans-serif';
$number_thousands_separator = ',';
$number_decimal_separator = '.';
// shortcuts for Byte, Kilo, Mega, Giga, Tera, Peta, Exa
//$byteUnits = array('Байт', 'кБ', 'МБ', 'ГБ');
$byteUnits = array('Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB');

$day_of_week = array('Нд', 'Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб');
$month = array('Січ', 'Лют', 'Бер', 'Квт', 'Трв', 'Чрв', 'Лип', 'Сер', 'Вер', 'Жов', 'Лис', 'Гру');
// See http://www.php.net/manual/en/function.strftime.php to define the
// variable below
$datefmt = '%B %d %Y р., %H:%M';

$timespanfmt = '%s днів, %s годин, %s хвилин і %s секунд';

$strAPrimaryKey = 'Було додано первинний ключ до %s';
$strAbortedClients = 'Перервано';
$strAbsolutePathToDocSqlDir = 'Прошу задати абсолютний шл