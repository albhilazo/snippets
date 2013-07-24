<?php

/**
 * Returns a given date in YYYYMMDDHHMMSS format
 * @link http://www.php.net/manual/en/datetime.createfromformat.php
 * 
 * @param $row_date		Date in 'd/m/y H:i' format
 */
function get_date($row_date)
{
	// DateTime can cause problems if the date is empty. Let's avoid it.
	if( !$row_date )	return "";
	$date = DateTime::createFromFormat('d/m/y H:i', $row_date);
	// YYYYMMDDHHMMSS = YmdHis
	return $date->format('YmdHis');
}




/**
 * Returns converted date/time to another time zone
 * @link http://www.epochconverter.com/programming/functions-php.php
 * 
 * @param $TimeStr			Original date/time
 * @param $TimeZoneFrom		Original timezone
 * @param $TimeZoneTo		Timezone wanted
 */
function change_timezone( $TimeStr="2012-01-01 12:00:00", $TimeZoneFrom="UTC", $TimeZoneTo="Europe/Andorra" )
{
	return date_create($TimeStr, new DateTimeZone($TimeZoneFrom))
		->setTimezone(new DateTimeZone($TimeZoneTo))->format("Y-m-d H:i:s");
}

?>