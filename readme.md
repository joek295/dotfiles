# Introduction:

My configuration files, with the exception of my Emacs configuration,
which deserves its own directory.  This repository also includes the
install.sh script which installs all of those dotfiles in the ./links/
directory into your home directory.

## Contents:

* vim configuration files: I have moved to Emacs for my daily coding
  needs, but still maintain a vim configuration for those times where
  it makes more sense.

* window manager configurations: the major window managers which I
  have used heavily, and hence have fairly thorough config files for,
  are xmonad, openbox, and fvwm.  I have used many others, however,
  and some of those may make an appearance in this repository as well.

* conky configuration: I have used conky as a system monitor since my
  first encounter with it, some time in 2011, with #! Statler.  My
  conky is a single line at the top of my monitor.

* bash and zsh configurations: I used bash for a long time, but have
  now moved on to trying out zsh.  I have rc files for both, a
  .functions and .aliases file which are both compatible with both
  (and, at least theoretically, other sh-based shells), and a fairly
  extensive .profile file.

* .xinitrc, .Xresources, and .xbindkeys files.

* misc other configuration files.

## Organisation:

Files in ./links/ should be in the directory structure they would be
in if they were in $HOME.  Anything which I don't necessarily install
into $HOME whenever I clone this repository is not in ./links/, but
should still be in the correct directory structure.

