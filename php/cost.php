<?php
/**
 * Get execution time for a piece of code
 */
    $time_start = microtime(true);
    $mem_before = memory_get_usage(true);
// CODE
    $mem_after = memory_get_usage(true);
    $time_end = microtime(true);

    echo "<h4>Execution Time:      ". ($time_end - $time_start) ." seconds</h4>";
    echo "<h4>Memory usage before: ". $mem_before ." bytes</h4>";
    echo "<h4>Memory usage after:  ". $mem_after ." bytes</h4>";




/**
 * Get memory usage for a bigger section
 */
    $cost = array();
    $cost['start'] = memory_get_usage(true);
// CODE
    $cost['check1'] = memory_get_usage(true);
// MOAR CODE
    $cost['check2'] = memory_get_usage(true);
// EVEN MORE CODE
    $cost['end'] = memory_get_usage(true);

    echo "<pre><h4>Memory usage:</h4>"; var_dump($cost); echo "</pre>";

?>