Configurations
==============

Configuration files for all my workstations including IDE settings.

Whenever using one of these configs just create a symbolic link to the appropriate
configuration file in this repo. I'll do my best to document whenver I add
a new file what I use it for.

## Creating Symbolic Link
In case this is new to you, this command will create a symbolic link.

    ln -s CONFIG_FILE_IN_REPO PATH_TO_SOURCE_CONFIG_FILE

So for example, to link your home profile to a profile in this repo, you'd run this:

    cd
    ln -s ~/projects/configurations/.profile ~/.profile

## List of Configs

#### OS User Configs

> **.profile** Mac configs including colorizing and git setup

> **.bashrc** Ubuntu configs including colorizing and other nicities copied from other places

#### Sublime Text Configs

> Install the following packages (largely based on [SublimeText2 Love](http://kennethreitz.org/sublime-text-2-love/))
* Package Control
* Theme - Soda (Dark)
* SublimeCodeIntel
* SublimeLinter
* Markdown Preview
* sublemacspro

> **sublimetext/Default (OSX).sublime-keymap** User Key Bindings

> **sublimetext/Preferences.sublime-settings** User Preferences with following packages
