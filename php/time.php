<?php

/**
 * Calculate execution time for a piece of code
 */
$time_start = microtime(true); 
// CODE
$time_end = microtime(true);
echo '<h4>Execution Time: '. ($time_end - $time_start) .' seconds</h4>';

?>