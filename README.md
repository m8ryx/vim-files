This is a shared README, as it is a common file between two vcsh-managed repositories.

# Common patterns

I manage my dotfiles in git using vcsh. A great writeup is available here: https://web.archive.org/web/20150220114446/http://www.martin-burger.net:80/blog/unix-shell/manage-dotfiles-quickly-and-effortlessly/

Sadly, the original blog looks to have gone away. I'll see if I can find it or repost the content with attribution.

Here is an example of how to get started managing one of the repos (shell-files):
```
vcsh init shell-files
vcsh enter shell-files
git remote add origin https://github.com/[your repo]/shell-files.git
move any old .bash* out of the way
git pull -u origin master
exit
```

# shell-files

This is heavily based on (ugh...where did I cobble this from...to be updated)
It utilizes https://github.com/josephwecker/bashrc_dispatch to allow cross-platform configurations.

I manage my shell files using vcsh, which is a super-cool way to have multiple git repos inside the same directory. It works nicely on both OS X and Linux.

Here's how I set mine up.

# vim-files

A lot of my .vimrc has been cobbled together from around the web. I've attempted to credit sources inside the file, but some were likely lost in antiquity. For getting started, a good source that I used heavily is https://dougblack.io/words/a-good-vimrc.html. Also see https://github.com/spf13/spf13-vim.

## Requirements
Using Ubuntu package names. It'd be pretty straightforward to comment out lines in the .vimrc if you don't need parts of this.

* silversearcher-ag (The Silver Searcher)
* cmake
* python-dev
* fonts-powerline
* vcsh (optional for dotfile management)
* mr (optional for dotfile management)

## Getting Started
If you're using vcsh, the following is a rough guideline for getting started

```
vcsh enter vim # this goes into the vim false dealie
git add the remote, pull it (using git), then exit from the chgit shell
cd ~/.vim && mkdir bundle
git clone git://github.com/gmarik/vundle
```
Then, inside vim
```
:BundleInstall
```

You'll need to build the YouCompleteMe binaries, which may require cmake, pyhton development, and other bits.
```
cd .vim/bundle/YouCompleteMe && ./install.py
```
