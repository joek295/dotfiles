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

* shell configuration: I have a fairly comprehensive set of
configuration files for both bash, which I used for many years, and
zsh, which I switched to around the end of 2014.  This includes: a
fairly extensive .profile file, which configures various settings
which are shell-independent; .bashrc and .zshrc files; the sh.d/
directory, containing settings which can be sourced by any sh-derived
shell; a functions file, in sh.d/, itself split into various parts;
the zsh.d/ directory, containing settings which can be sourced by zsh;
the bash.d/ directory, containing settings which can be sourced by
bash; an .inputrc file for programs, including bash, which use
readline; and .bash_logout, .bash_profile, and .zprofile files.

* .xinitrc, .Xresources, and .xbindkeys files.

* misc other configuration files.

* colorthemes for .Xresources, in the colorthemes/ directory.

## Organisation:

Files in ./links/ should be in the directory structure they would be
in if they were in $HOME.  Anything which I don't necessarily install
into $HOME whenever I clone this repository is not in ./links/, but
should still be in the correct directory structure.

As much as possible is kept out of the way in the dotfiles directory
itself.  Files in links/ source from various files in the dotfiles
directory, and there is no guarantee that they will work out of the
box without fixing these links.  Files to look out for include:

* .zshrc

* .bashrc

* .Xresources

* sh.d/functions, which is sourced by both .zshrc and .bashrc.


## Installation of Dotfiles:

1. Clone this repository.

2. Ensure that all files to install are in the ./links/ folder.

3. Run ./install.sh

## UNLICENSE:

On the off-chance that anyone actually wants to use it, install.sh is
released into the public domain with the [unlicense](unlicense.org).

> This is free and unencumbered software released into the public
domain.

> Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

> In jurisdictions that recognize copyright laws, the author or
authors of this software dedicate any and all copyright interest in
the software to the public domain. We make this dedication for the
benefit of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

> For more information, please refer to <http://unlicense.org>
