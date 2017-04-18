A lot of my .vimrc has been cobbled together from around the web. I've attempted to credit sources inside the file, but some were likely lost in antiquity. For getting started, a good source that I used heavily is https://dougblack.io/words/a-good-vimrc.html

# vim-files
my vim files excluding bundles, of which there are several

I manage my dotfiles in git using vcsh. A great writeup is available here: https://web.archive.org/web/20150220114446/http://www.martin-burger.net:80/blog/unix-shell/manage-dotfiles-quickly-and-effortlessly/

Sadly, the original blog looks to have gone away. I'll see if I can find it or repost the content with attribution.

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

