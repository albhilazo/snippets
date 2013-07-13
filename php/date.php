/**
 * Returns a given date in YYYYMMDDHHMMSS format
 * @param $row_date	Date in 'd/m/y H:i' format
 */
function get_date($row_date)
{
	// DateTime can cause problems if the date is empty. Let's avoid it.
	if( !$row_date )	return "";
	$date = DateTime::createFromFormat('d/m/y H:i', $row_date);
	// YYYYMMDDHHMMSS = YmdHis
	return $date->format('YmdHis');
}