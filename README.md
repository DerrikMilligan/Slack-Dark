# Slack-Dark
Taken initially from the [ArchLinux package](https://aur.archlinux.org/packages/slack-desktop-dark/).

Now they're using [this new repo](https://github.com/caiceA/slack-raw) for the styling. That repo had a better install script, which I found modifications that should make it work on any OS.

# Prerequisites
 - Download and install this font: [Muli Font](https://www.fontsquirrel.com/fonts/download/muli)
 - Make sure the node `asar` package is installed `npm install -g asar`

# Installation
 - After finishing the prerequisites, simply run `patch_slack.bash` *(It'll ask for your password as it's using sudo.)*

# Simple Installation
```
bash <<<"$(curl https://raw.githubusercontent.com/DerrikMilligan/Slack-Dark/master/patch_slack.bash)"
```
