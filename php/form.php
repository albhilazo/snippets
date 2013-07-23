<?php

/**
 * Checkbox checked by default and remembers value
 */
<input type="checkbox" name="exactsearch" value="checked"
<?php if($_GET['exactsearch'] || !isset($_GET['submit'])) echo "checked"; ?>> Exact search

?>