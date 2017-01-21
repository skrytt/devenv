# devenv
Personal development environment files

## Distribution Upgrade from Debian Jessie/stable to Stretch/testing - notes
* `apt-get dist-upgrade` fails the first time because systemd is the active initsystem and needs to be upgraded. I was able to work around this using `reboot` followed by `apt-get dist-upgrade -f`.
* Following the successful distribution upgrade, I needed to again `reboot` to ensure I was running the 4.8 Linux kernel, which I verified using `uname -a`.
* I removed the `virtualbox-guest-*` packages, then installed the `linux-headers-4.8.0-2-amd64` and `virtualbox-guest-additions-iso` packages to prepare for installing the new Virtualbox Guest Additions.
* Following a `mount /usr/share/virtualbox/VBoxGuestAdditions.iso /media/cdrom && cd /media/cdrom` I was able to run `./VBoxLinuxAdditions.run` to install Virtualbox Guest Additions 5.1.12, which was consistent with the version of Virtualbox on my Windows host machine.
* I found that when trying to run `startx`, I got a permissions error: `xf86EnableIOPorts: failed to set IOPL for I/O (Operation not permitted)`. I found that adding my user to the `video` group (and then logging out and in) resolved this: `usermod -a -G video mkemp`
* Following all these steps I was able to `startx` to run the X server with i3 as the display manager, lxterminal as the default terminal and full Solarized colourscheme as I wanted :)
