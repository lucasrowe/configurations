Configurations
==============

Configuration files for all my workstations including IDE settings.

Whenever using one of these configs just create a symbolic link to the appropriate
configuration file in this repo. I'll do my best to document the purpose of config files.

## Creating Symbolic Link
This command will create a symbolic link at a specified location.

    ln -s CONFIG_FILE_IN_REPO NEW_SYMLINK_LOCATION

So for example, to link your home profile to a profile in this repo, you'd run this:

    cd
    ln -s ~/projects/configurations/.profile ~/.profile

To import a new configuration to this repo, move the config file into the repo and use
the above command to make a symlink where the config file used to be that points
to the file now in the repository.


    mv ~/.profile ~/projects/configurations/.profile
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

> **.vimrc** Vim settings (Color Schemes will need to be downloaded separately)
