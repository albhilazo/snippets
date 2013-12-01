/* Explicit intent */

/**
 * The Explicit Intent defines the exact class name of the component you want to start.
 * From Starting Another Activity:      http://developer.android.com/training/basics/firstapp/starting-activity.html
 */
    Intent intent = new Intent(this, DisplayMessageActivity.class);
    startActivity(intent);

    // With extra contents
    Intent intent = new Intent(this, DisplayMessageActivity.class);
    EditText editText = (EditText) findViewById(R.id.edit_message);
    String message = editText.getText().toString();
    intent.putExtra(EXTRA_MESSAGE, message);
    startActivity(intent);


/**
 * Receive the intent
 */
    // In order for the next activity to query the extra data, you should define the key for your intent's extra
    // using a public constant. So add the EXTRA_MESSAGE definition to the top of the MainActivity class:
    public class MainActivity extends Activity {
        public final static String EXTRA_MESSAGE = "com.example.myfirstapp.MESSAGE";
        ...
    }

    // Get the message from the intent
    Intent intent = getIntent();
    String message = intent.getStringExtra(MainActivity.EXTRA_MESSAGE);
