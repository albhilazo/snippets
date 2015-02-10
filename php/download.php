<?php
/* Plain text CSV ******************************************************************************* */

/**
 * Generates a Comma Separated Values (CSV) file to download and exits.
 * @param {String} $filename - Result file name without extension
 * @param {Array} $data - Data collection
 * @param {Array} $heading - First line column headings (optional)
 */
public function downloadCSV($filename, $data, $heading=NULL)
{
    // No cache
    header('Cache-Control: no-store, no-cache');
    // MIME type and download attributes
    header('Content-Type: text/csv; charset=utf-8');
    header('Content-Disposition: attachment; filename="'.$filename.'.csv');

    // Open the output stream for fputcsv
    $output = fopen('php://output', 'w');

    // Column headings
    if ($heading)
        fputcsv($output, $heading);
    // Data rows
    foreach ($data as $row)
        fputcsv($output, $row);

    exit;
}




/* Excel formatted file************************************************************************** */

/**
 * Generates an Excel formatted file to download and exits.
 * @param {String} $filename - Result file name without extension
 * @param {Array} $data - Data collection
 * @param {Array} $heading - First line column headings (optional)
 * @see {@link http://stackoverflow.com/a/16766198/2629765}
 */
public function downloadExcel($filename, $data, $heading=NULL)
{
    // To avoid compatibility warnings and keep Excel formatting
    //   we have to output an encoded CSV file

    // Column headings
    $csv = ($heading) ? '"'.implode('"'."\t".'"', $heading).'"'."\n" : '';
    // Data rows
    foreach($data as $row)
        $csv .= '"'.implode('"'."\t".'"', $row).'"'."\n";

    // Excel CSV files use a tab as separator and are encoded as UTF-16LE with a BOM
    $encoded_csv = mb_convert_encoding($csv, 'UTF-16LE', 'UTF-8');

    // No cache (compatible)
    header('Pragma: public');
    header('Expires: 0');
    header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
    // MIME type and download attributes
    header('Content-Description: File Transfer');
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment; filename="'.$filename.'.csv"');
    header('Content-Transfer-Encoding: binary');
    header('Content-Length: '.strlen($encoded_csv));

    // Prepend Byte Order Mark (BOM) and send content
    echo chr(255).chr(254) . $encoded_csv;
    exit;
}