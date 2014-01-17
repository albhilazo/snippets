<?php
/****************************************************************************
 *  @author     Albert Hilazo                                               *
 *                                                                          *
 *  Input:                                                                  *
 *      __construct( $name, $id, $value, $placeholder, $label, $class )     *
 *      load()                                                              *
 *      load_hidden()                                                       *
 *      load_inline()                                                       *
 *      Input::load_two_inline( Input $left, Input $right, $label=NULL )    *
 *                                                                          *
 *  Checkbox:                                                               *
 *      __construct( $name, $label, $labelclass, $state )                   *
 *      load()                                                              *
 ****************************************************************************/

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
     * Loads a simple form input
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
     * Loads a simple hidden form input
     */
    public function load_hidden()
    {
        if( $this->label )    echo "<label for='$this->id'>$this->label</label>";
        echo "<input type='hidden' name='$this->name' id='$this->id'"
                  .(($this->class) ? " class='$this->class'" : "")
                  .(($this->placeholder) ? " placeholder='$this->placeholder'" : "")
                  ." value='$this->value'/>";
    }




    /**
     * Loads a form input with inline label
     */
    public function load_inline()
    {
        echo "<label class='control-label' for='$this->id'>"
                  .(($this->label) ? " $this->label" : " ")
                  ."</label>";
        echo "<div class='controls'>";
        echo "    <input type='text' name='$this->name' id='$this->id'"
                      .(($this->class) ? " class='$this->class'" : "")
                      .(($this->placeholder) ? " placeholder='$this->placeholder'" : "")
                      ." value='$this->value'/>";
        echo "</div>";
    }




    /**
     * Loads two inline form inputs
     *
     * @param $left     Left input instance
     * @param $right    Right input instance
     * @param $label    Label string to group both inputs (optional)
     */
    public static function load_two_inline(Input $left, Input $right, $label=NULL)
    {
        // Label will be assigned to left input
        if( $label )    echo "<label for='$left->id'>$label</label>";
        echo "<input type='text' name='$left->name' id='$left->id'"
                  .(($left->class) ? " class='$left->class'" : "")
                  .(($left->placeholder) ? " placeholder='$left->placeholder'" : "")
                  ." value='$left->value'/>";
        echo "&nbsp;&nbsp;&nbsp;&nbsp;";
        echo "<input type='text' name='$right->name' id='$right->id'"
                  .(($right->class) ? " class='$right->class'" : "")
                  .(($right->placeholder) ? " placeholder='$right->placeholder'" : "")
                  ." value='$right->value'/>";
    }
}








class Checkbox
{
    private $name;
    private $label;
    private $labelclass;
    private $state;


    /**
     * Constructor for a new Checkbox instance
     *
     * @param $name          Name attribute value
     * @param $label         String to show next to the checkbox
     * @param $labelclass    Class to add to the label tag
     * @param $state         If the checkbox will load checked or not {TRUE|FALSE}
     */
    public function __construct($name, $label, $labelclass, $state)
    {
        $this->name       = $name;
        $this->label      = $label;
        $this->labelclass = $labelclass;
        $this->state      = $state;
    }




    /**
     * Loads a simple form checkbox
     */
    public function load()
    {
        echo "<label class='checkbox"
                  .(($this->labelclass) ? " $this->labelclass" : "")
                  ."'>";
        echo "<input type='checkbox' value='checked' name='$this->name'"
                  .(($this->state) ? " checked" : "")
                  ."/> $this->label";
        echo "</label>";
    }
}

?>