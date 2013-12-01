/* Explicit intent */

/**
 * The Explicit Intent defines the exact class name of the component you want to start.
 * From Starting Another Activity:      http://developer.android.com/training/basics/firstapp/starting-activity.html
 */

Intent intent = new Intent(this, DisplayMessageActivity.class);

EditText editText = (EditText) findViewById(R.id.edit_message);
String message = editText.getText().toString();
intent.putExtra(EXTRA_MESSAGE, message);
startActivity(intent);