<?php
/********************************************************************************
 *  @author     Albert Hilazo                                                   *
 *                                                                              *
 *  Input:                                                                      *
 *      __construct( $name, $id, $value, $placeholder, $label, $class )         *
 *      load()                                                                  *
 *      load_hidden()                                                           *
 *      load_inline($is_grouped=FALSE)                                          *
 *      Input::load_double( Input $left, Input $right, $label=NULL )            *
 *      Input::load_two_inline( Input $left, Input $right, $is_grouped=FALSE )  *
 *                                                                              *
 *  Checkbox:                                                                   *
 *      __construct( $name, $id, $label, $labelclass, $state )                  *
 *      load()                                                                  *
 *                                                                              *
 *  Select:                                                                     *
 *      __construct( $name, $id, $options, $placeholder, $label, $class )       *
 *      load()                                                                  *
 *      load_inline($is_grouped=FALSE)                                          *
 ********************************************************************************/

namespace albhilazo\Form;


class Input
{
    private $name;
    private $id;
    private $value;
    private $placeholder;
    private $label;
    private $class;


    /**
     * Constructor for a new Input instance
     * 
     * @param $name         Name attribute value (required)
     * @param $id           Id attribute value (required)
     * @param $value        Input content (required)
     * @param $placeholder  String to show as placeholder
     * @param $label        String to show next to the input
     * @param $class        Class to add to the input tag
     */
    public function __construct($name, $id, $value, $placeholder, $label, $class)
    {
        $this->name        = $name;
        $this->id          = $id;
        $this->value       = $value;
        $this->placeholder = (empty($placeholder)) ? NULL : $placeholder;
        $this->label       = (empty($label)) ? NULL : $label;
        $this->class       = (empty($class)) ? NULL : $class;
    }




    /**
     * Loads a simple input
     */
    public function load()
    {
        if( $this->label )    echo "<label for='$this->id'>$this->label</label>";
        echo "<input type='text' name='$this->name' id='$this->id'"
                  .(($this->class) ? " class='$this->class'" : "")
                  .(($this->placeholder) ? " placeholder='$this->placeholder'" : "")
                  ." value='$this->value'/>";
    }




    /**
     * Loads a simple hidden input
     */
    public function load_hidden()
    {
        echo "<input type='hidden' name='$this->name' id='$this->id'"
                  .(($this->class) ? " class='$this->class'" : "")
                  .(($this->placeholder) ? " placeholder='$this->placeholder'" : "")
                  ." value='$this->value'/>";
    }




    /**
     * Loads an input with inline label
     * Requires a form with .form-horizontal class
     *
     * @param $is_grouped    If the input is grouped with another one {TRUE|FALSE} (optional)
     */
    public function load_inline($is_grouped=FALSE)
    {
        if( !$is_grouped )    echo "<div class='control-group'>";

        echo "<label class='control-label' for='$this->id'>"
                  .(($this->label) ? " $this->label" : " ")
                  ."</label>";
        echo "<div class='controls'>";
        echo "    <input type='text' name='$this->name' id='$this->id'"
                      .(($this->class) ? " class='$this->class'" : "")
                      .(($this->placeholder) ? " placeholder='$this->placeholder'" : "")
                      ." value='$this->value'/>";
        echo "</div>";

        if( !$is_grouped )    echo "</div>";
    }




    /**
     * Loads an inline double input
     *
     * @param $left     Left input instance
     * @param $right    Right input instance
     * @param $label    Label string to group both inputs (optional)
     */
    public static function load_double(Input $left, Input $right, $label=NULL)
    {
        // Label will be assigned to left input
        if( $label )    echo "<label for='$left->id'>$label</label>";

        // Left input
        echo "<input type='text' name='$left->name' id='$left->id'"
                  .(($left->class) ? " class='$left->class'" : "")
                  .(($left->placeholder) ? " placeholder='$left->placeholder'" : "")
                  ." value='$left->value'/>";

        echo "&nbsp;&nbsp;&nbsp;&nbsp;";

        // Right input
        echo "<input type='text' name='$right->name' id='$right->id'"
                  .(($right->class) ? " class='$right->class'" : "")
                  .(($right->placeholder) ? " placeholder='$right->placeholder'" : "")
                  ." value='$right->value'/>";
    }




    /**
     * Loads two inline inputs with inline labels
     * Requires a form with .form-horizontal class
     *
     * @param $left     Left input instance
     * @param $right    Right input instance
     * @param $is_grouped    If the input is grouped with another one {TRUE|FALSE} (optional)
     */
    public static function load_two_inline(Input $left, Input $right, $is_grouped=FALSE)
    {
        if( !$is_grouped )    echo "<div class='control-group'>";

        // Left input
        echo "<div class='inline'>";
        echo "<label class='control-label' for='$left->id'>"
                  .(($left->label) ? " $left->label" : " ")
                  ."</label>";
        echo "<div class='controls'>";
        echo "    <input type='text' name='$left->name' id='$left->id'"
                      .(($left->class) ? " class='$left->class'" : "")
                      .(($left->placeholder) ? " placeholder='$left->placeholder'" : "")
                      ." value='$left->value'/>";
        echo "</div>";
        echo "</div>";

        echo "&nbsp;&nbsp;&nbsp;&nbsp;";

        // Right input
        echo "<div class='inline'>";
        echo "<label class='control-label' for='$right->id'>"
                  .(($right->label) ? " $right->label" : " ")
                  ."</label>";
        echo "<div class='controls'>";
        echo "    <input type='text' name='$right->name' id='$right->id'"
                      .(($right->class) ? " class='$right->class'" : "")
                      .(($right->placeholder) ? " placeholder='$right->placeholder'" : "")
                      ." value='$right->value'/>";
        echo "</div>";
        echo "</div>";

        if( !$is_grouped )    echo "</div>";
    }
}








class Checkbox
{
    private $name;
    private $id;
    private $label;
    private $labelclass;
    private $state;


    /**
     * Constructor for a new Checkbox instance
     *
     * @param $name          Name attribute value
     * @param $id            Id attribute value
     * @param $label         String to show next to the checkbox
     * @param $labelclass    Class to add to the label tag
     * @param $state         If the checkbox will load checked or not {TRUE|FALSE}
     */
    public function __construct($name, $id, $label, $labelclass, $state)
    {
        $this->name       = $name;
        $this->id         = $id;
        $this->label      = $label;
        $this->labelclass = $labelclass;
        $this->state      = $state;
    }




    /**
     * Loads a simple checkbox
     */
    public function load()
    {
        echo "<label class='checkbox"
                  .(($this->labelclass) ? " $this->labelclass" : "")
                  ."'>";
        echo "<input type='checkbox' value='checked' name='$this->name' id='$this->id'"
                  .(($this->state) ? " checked" : "")
                  ."/> $this->label";
        echo "</label>";
    }
}








class Select
{
    private $name;
    private $id;
    private $options;
    private $placeholder;
    private $label;
    private $class;


    /**
     * Constructor for a new Select instance
     *
     * @param $name         Name attribute value (required)
     * @param $id           Id attribute value (required)
     * @param $options      Select options array (required)
     * @param $placeholder  Default string to show on load
     * @param $label        String to show next to the select
     * @param $class        Class to add to the select tag
     */
    public function __construct( $name, $id, $options, $placeholder, $label, $class )
    {
        $this->name        = $name;
        $this->id          = $id;
        $this->options     = $options;
        $this->placeholder = (empty($placeholder)) ? NULL : $placeholder;
        $this->label       = (empty($label)) ? NULL : $label;
        $this->class       = (empty($class)) ? NULL : $class;
    }




    /**
     * Loads a simple select
     */
    public function load()
    {
        if( $this->label )
            echo "<label for='$this->id'>$this->label</label>";

        echo "<select name='$this->name' id='$this->id'"
                  .(($this->class) ? " class='$this->class'" : "")
                  .">";

        if( $this->placeholder )
            echo "<option value='' disabled selected>$this->placeholder</option>";

        foreach( $this->options as $option )
        {
            echo "<option value='$option'>$option</option>";
        }

        echo "</select>";
    }




    /**
     * Loads a select with inline label
     * Requires a form with .form-horizontal class
     *
     * @param $is_grouped    If the input is grouped with another one {TRUE|FALSE} (optional)
     */
    public function load_inline($is_grouped=FALSE)
    {
        if( !$is_grouped )    echo "<div class='control-group'>";

        echo "<label class='control-label' for='$this->id'>"
                  .(($this->label) ? " $this->label" : " ")
                  ."</label>";

        echo "<div class='controls'>";
        echo "    <select name='$this->name' id='$this->id'"
                      .(($this->class) ? " class='$this->class'" : "")
                      .">";

        if( $this->placeholder )
            echo "<option value='' disabled selected>$this->placeholder</option>";

        foreach( $this->options as $option )
        {
            echo "<option value='$option'>$option</option>";
        }

        echo "    </select>";
        echo "</div>";

        if( !$is_grouped )    echo "</div>";
    }
}

?>