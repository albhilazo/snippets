# Snippets

Collection of snippets for multiple languages or libraries.

### Current sections:
+ Android
+ iOS
+ Bash
+ CSS
+ JavaScript (jQuery, Node)
+ PHP

## Terminal access
The script **snippets.sh** provides access to the snippets through terminal.
```shell
$ snippets.sh <language> <snippet>
```

You can check the usage syntax and available languages calling the script without parameters or using:
```shell
$ snippets.sh --help
```

And to get a list of the available snippets for a particular language:
```shell
$ snippets.sh <language>
# or
$ snippets.sh --help <language>
```

The script can be configured to open the snippets in the default text editor or a specified one:
```shell
$ snippets.sh --seteditor default
# or
$ snippets.sh --seteditor <editor-command>
```