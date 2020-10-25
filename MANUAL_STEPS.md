# Manual Steps

Here I describe what are the necessary manual steps ('cause I couldn't automate it properly)

## Jetbrains Toolbox

I have to go to `/opt/jetbrains-toolbox/jetbrains-toolbox` and execute the binary for the first time.

## zsh

These commands have to be executed to setup zsh

```shell
autoload -Uz zsh-newuser-install
zsh-newuser-install -f
```

> Note: Make sure your terminal's size is at least 72×15 otherwise zsh-newuser-install will not run.

```
/etc/zsh/zshenv Used for setting environment variables for all users; it should not contain commands that produce output or assume the shell is attached to a TTY. When this file exists it will always be read, this cannot be overridden.
$ZDOTDIR/.zshenv Used for setting user's environment variables; it should not contain commands that produce output or assume the shell is attached to a TTY. When this file exists it will always be read.
/etc/zsh/zprofile Used for executing commands at start for all users, will be read when starting as a login shell. Please note that on Arch Linux, by default it contains one line which sources /etc/profile. See warning below before wanting to remove that!
    /etc/profile This file should be sourced by all POSIX sh-compatible shells upon login: it sets up $PATH and other environment variables and application-specific (/etc/profile.d/*.sh) settings upon login.
$ZDOTDIR/.zprofile Used for executing user's commands at start, will be read when starting as a login shell. Typically used to autostart graphical sessions and to set session-wide environment variables.
/etc/zsh/zshrc Used for setting interactive shell configuration and executing commands for all users, will be read when starting as an interactive shell.
$ZDOTDIR/.zshrc Used for setting user's interactive shell configuration and executing commands, will be read when starting as an interactive shell.
/etc/zsh/zlogin Used for executing commands for all users at ending of initial progress, will be read when starting as a login shell.
$ZDOTDIR/.zlogin Used for executing user's commands at ending of initial progress, will be read when starting as a login shell. Typically used to autostart command line utilities. Should not be used to autostart graphical sessions, as at this point the session might contain configuration meant only for an interactive shell.
$ZDOTDIR/.zlogout Used for executing commands when a login shell exits.
/etc/zsh/zlogout Used for executing commands for all users when a login shell exits.
```

### Install zsh plugin manager

TODO I still have to try it out: https://github.com/zsh-users/antigen

## Install asdf and sdkman


https://asdf-vm.com/#/core-manage-asdf?id=asdf

https://sdkman.io/install