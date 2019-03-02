## moss

![](https://img.buzzfeed.com/buzzfeed-static/static/2016-02/11/9/enhanced/webdr14/anigif_enhanced-9258-1455201854-2.gif)

This is **M**y mac**OS** **S**etup script I use for fresh installs or after doing
some heavy system clean up and want to reinstall any missing tools/packages.

If you find this useful you can use it as well, of course, although there's a
good chance you'll need to make a change or two in some of the scripts.

### Usage

Clone the repo and then run `./install`.

If you want to toggle which features to be installed, edit the list in the `./install` file:

```sh
MOSS_INSTALL_FEATURES=(
   brew
   fonts
   iterm
   zsh
   ssh
   gpg
   git
   vim
   node
   vscode
   docker
   utils
   apps
)
```

### Issues and contributions

Suggestions and bug reports are welcome, but please have in mind this tool is just
for personal use and I take no responsibility if it breaks something on your end.
