<?php
/****************************************************************************************
 *  @author     Albert Hilazo                                                           *
 *  @version    1.0.0                                                                   *
 *                                                                                      *
 *  Static procedures:                                                                  *
 *      get_DMY( $ymd_date )                                                            *
 *      get_YMD( $dmy_date, $end_day=FALSE )                                            *
 *      change_timezone( $date, $timezone_from='UTC', $timezone_to='Europe/Berlin' )    *
 ****************************************************************************************/

namespace albhilazo;


/**
 * Converts dates between formats
 * All methods convert from UnixTime formats too
 *
 * @see http://php.net/manual/en/function.date.php
 * @see http://php.net/manual/en/datetime.createfromformat.php
 */
class Date
{
    /**
     * Default timezone
     */
    const TIMEZONE = 'Europe/Andorra';


    /**
     * DateTime PHP class formats
     * If changed, edit the regular expressions accordingly
     */
    const DMY_FORMAT        = 'd/m/y';
    const DMYY_FORMAT       = 'd/m/Y';
    const DMY_H_FORMAT      = 'd/m/y H';
    const DMYY_H_FORMAT     = 'd/m/Y H';
    const DMY_HM_FORMAT     = 'd/m/y H:i';
    const DMYY_HM_FORMAT    = 'd/m/Y H:i';
    const DMY_HMS_FORMAT    = 'd/m/y H:i:s';
    const DMYY_HMS_FORMAT   = 'd/m/Y H:i:s';
    const YMD_FORMAT        = 'Y-m-d';
    const YMD_END_FORMAT    = 'Y-m-d-23.59.59';
    const YMD_H_END_FORMAT  = 'Y-m-d-H.59.59';
    const YMD_HM_END_FORMAT = 'Y-m-d-H.i.59';
    const YMD_HMS_FORMAT    = 'Y-m-d-H.i.s';
    const YMD_HMSU_FORMAT   = 'Y-m-d-H.i.s.u';


    /**
     * Regular expressions for date formats
     */
    const UNIXTIME_REGEX = '#^[0-9]{10,11}$#';
    const DMY_REGEX      = '#^(0?[1-9]|[12][0-9]|3[01])/(0?[1-9]|1[012])/(19|20)?[0-9][0-9]$#';
    const DMYY_REGEX     = '#^(0?[1-9]|[12][0-9]|3[01])/(0?[1-9]|1[012])/[0-9][0-9]( ([01]?[0-9]|2[0-3])(:[0-5][0-9](:[0-5][0-9])?)?)?$#';
    const DMYYYY_REGEX   = '#^(0?[1-9]|[12][0-9]|3[01])/(0?[1-9]|1[012])/(19|20)[0-9][0-9]( ([01]?[0-9]|2[0-3])(:[0-5][0-9](:[0-5][0-9])?)?)?$#';
    const DMY_H_REGEX    = '#^(0?[1-9]|[12][0-9]|3[01])/(0?[1-9]|1[012])/(19|20)?[0-9][0-9] ([01]?[0-9]|2[0-3])$#';
    const DMY_HM_REGEX   = '#^(0?[1-9]|[12][0-9]|3[01])/(0?[1-9]|1[012])/(19|20)?[0-9][0-9] ([01]?[0-9]|2[0-3]):[0-5][0-9]$#';
    const DMY_HMS_REGEX  = '#^(0?[1-9]|[12][0-9]|3[01])/(0?[1-9]|1[012])/(19|20)?[0-9][0-9] ([01]?[0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]$#';
    const DMY_ANY_REGEX  = '#^(0?[1-9]|[12][0-9]|3[01])/(0?[1-9]|1[012])/(19|20)?[0-9][0-9]( ([01]?[0-9]|2[0-3])(:[0-5][0-9](:[0-5][0-9])?)?)?$#';
    const YMD_REGEX      = '#^(19|20)[0-9][0-9]-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$#';
    const YMD_H_REGEX    = '#^(19|20)[0-9][0-9]-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])-([01][0-9]|2[0-3])$#';
    const YMD_HM_REGEX   = '#^(19|20)[0-9][0-9]-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])-([01][0-9]|2[0-3]).[0-5][0-9]$#';
    const YMD_HMS_REGEX  = '#^(19|20)[0-9][0-9]-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])-([01][0-9]|2[0-3]).[0-5][0-9].[0-5][0-9](.[0-9]{6})?$#';
    const YMD_ANY_REGEX  = '#^(19|20)[0-9][0-9]-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])(-([01][0-9]|2[0-3])(.[0-5][0-9](.[0-5][0-9](.[0-9]{6})?)?)?)?$#';




    /**
     * Returns a given date in 'd/m/y H:i' format
     * 
     * @param $ymd_date     Date in 'Y-m-d-H.i.s' or UnixTime format
     */
    public static function get_DMY($ymd_date)
    {
        // Avoid warning for using the system timezone
        date_default_timezone_set( self::TIMEZONE );

        // DateTime can cause problems if the date is empty. Let's avoid it.
        if( !$ymd_date )    return "";

        // If the format is correct just return it
        if( preg_match( self::DMY_ANY_REGEX, $ymd_date ))    return $ymd_date;

        // Accept Unix Timestamp format
        if( preg_match( self::UNIXTIME_REGEX, $ymd_date ))
        {
            // Setting the Timezone required
            $date = \DateTime::createFromFormat( 'U', $ymd_date )->setTimezone(new \DateTimeZone( self::TIMEZONE ));
            return $date->format( self::DMY_HM_FORMAT );
        }

        // YMD -> DMY
        if( preg_match( self::YMD_HMS_REGEX, $ymd_date ))
        {
            $date = \DateTime::createFromFormat( self::YMD_HMSU_FORMAT, $ymd_date );
            return $date->format( self::DMY_HM_FORMAT );
        }
        else
        {
            return FALSE;
        }
    }




    /**
     * Returns a given date in 'Y-m-d-H:i:s' format
     * Accepts 2 and 4 year digits
     * 
     * @param $dmy_date    Date in 'd/m/y H:i:s' or UnixTime format
     * @param $end_day     Optional boolean. TRUE to return last time value (23:59:59)
     */
    public static function get_YMD($dmy_date, $end_day=FALSE)
    {
        // Avoid warning for using the system timezone
        date_default_timezone_set( self::TIMEZONE );

        // DateTime can cause problems if the date is empty. Let's avoid it.
        if( !$dmy_date )    return "";

        // If the format is correct just return it
        if( preg_match( self::YMD_ANY_REGEX, $dmy_date ))    return $dmy_date;

        // Accept Unix Timestamp format
        if( preg_match( self::UNIXTIME_REGEX, $dmy_date ))
        {
            // Setting the Timezone required
            $date = \DateTime::createFromFormat( 'U', $dmy_date )->setTimezone(new \DateTimeZone( self::TIMEZONE ));
            return $date->format( self::YMD_HMS_FORMAT );
        }

        // Detect two or four digits year
        if( preg_match( self::DMYY_REGEX, $dmy_date ))           $year_2digits = TRUE;
        else if( preg_match( self::DMYYYY_REGEX, $dmy_date ))    $year_2digits = FALSE;
        else                                                     return FALSE;
        
        // DMY -> YMD
        // Accept multiple DateTime formats
        if( preg_match( self::DMY_REGEX, $dmy_date ))
        {
            if( $year_2digits )    $format_in  = self::DMY_FORMAT;
            else                   $format_in  = self::DMYY_FORMAT;

            if( $end_day )         $format_out = self::YMD_END_FORMAT;
            else                   $format_out = self::YMD_FORMAT;
        }
        else if( preg_match( self::DMY_H_REGEX, $dmy_date ))
        {
            if( $year_2digits )    $format_in  = self::DMY_H_FORMAT;
            else                   $format_in  = self::DMYY_H_FORMAT;

            if( $end_day )         $format_out = self::YMD_H_END_FORMAT;
            else                   $format_out = self::YMD_HMS_FORMAT;
        }
        else if( preg_match( self::DMY_HM_REGEX, $dmy_date ))
        {
            if( $year_2digits )    $format_in  = self::DMY_HM_FORMAT;
            else                   $format_in  = self::DMYY_HM_FORMAT;

            if( $end_day )         $format_out = self::YMD_HM_END_FORMAT;
            else                   $format_out = self::YMD_HMS_FORMAT;
        }
        else if( preg_match( self::DMY_HMS_REGEX, $dmy_date ))
        {
            if( $year_2digits )    $format_in  = self::DMY_HMS_FORMAT;
            else                   $format_in  = self::DMYY_HMS_FORMAT;

            $format_out = self::YMD_HMS_FORMAT;
        }
        else
        {
            return FALSE;
        }

        $date = \DateTime::createFromFormat( $format_in, $dmy_date );
        return $date->format($format_out);
    }




    /**
     * Returns converted date/time to another time zone
     * 
     * @see http://www.epochconverter.com/programming/functions-php.php
     * 
     * @param $date             Original date/time
     * @param $timezone_from    Original timezone
     * @param $timezone_to      Timezone wanted
     */
    public static function change_timezone($date, $timezone_from='UTC', $timezone_to=self::TIMEZONE)
    {
        // DateTime can cause problems if the date is empty. Let's avoid it.
        if( !$date )    return "";

        return date_create($date, new \DateTimeZone($timezone_from))
                   ->setTimezone(new \DateTimeZone($timezone_to))->format(self::YMD_HMS_FORMAT);
    }
}

?>