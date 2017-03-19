#!/bin/bash
# Script to provision a Debian Linux system to meet my needs for a development environment.

# Convenience function for grabbing stuff from git repos
# depending on whether a local repo is available yet
git_get_latest() {
  # Usage: git_get_latest <branchdir> <repourl>
  if test "$#" -ne "2"
  then
    echo "Wrong number of arguments to git_get_latest - aborting"
    exit 1
  fi
  local branchdir="$1"
  local repourl="$2"
  if test -d "$branchdir" ; then
    if ! {
      cd "$branchdir" && git pull
    }
    then
      echo "Failed to update $branchdir - aborting"
      exit 1
    fi
  else
    if ! git clone "$repourl" "$branchdir"
    then
      echo "Failed to get $repourl - aborting"
      exit 1
    fi
  fi
}

if test "$(id -u)" != "0" ; then
  echo "Run as root"
  exit 1
fi

export DEBIAN_FRONTEND=noninteractive

if ! {
  apt-get update && apt-get upgrade -y && apt-get autoremove -y
}
then
  echo "Could not upgrade existing packages - aborting"
  exit 1
fi

# Ensure we have packages needed for grabbing data from various web locations
# and for supporting https transport for apt
if ! apt-get install -y \
  apt-transport-https ca-certificates software-properties-common \
  git curl wget rsync
then
  echo "Could not install packages (stage 1) - aborting"
  exit 1
fi

# Grab files from github, including new sources.list.d entries. Install them to /etc/.
# Wipe existing apt-get repository configuration before we copy in the new config.
# For the skel files, if user mkemp already exists then copy the files to the homedir too.
git_get_latest "/var/tmp/devenv" "https://github.com/skrytt/devenv"
cd "/var/tmp/devenv" && {
  rm -f /etc/apt/sources.list
  rm -f /etc/apt/sources.list.d/*
  chown -R root:root ./etc && rsync -a {.,}/etc/
  chown -R mkemp:mkemp ./etc && rsync -a ./etc/skel/ /home/mkemp/
}

# Configure repo for Docker CE, then apt-get update to make it available
if ! {
  curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - && \
    apt-key fingerprint 0EBFCD88 && \
    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/debian \
      $(lsb_release -cs) \
      stable" && \
    apt-get update
}
then
  echo "Failed to configure repo for Docker - aborting"
  exit 1
fi

# Continue installing useful packages
if ! apt-get install -y \
  "linux-image-$(uname -r)" linux-headers-amd64 \
  vim \
  gcc g++ python python3 elixir ruby \
  make automake cmake \
  pylint shellcheck \
  xserver-xorg xinit rxvt-unicode feh compton \
  docker-ce
then
  echo "Could not install packages (stage 2) - aborting"
  exit 1
fi

# i3-gaps display manager
git_get_latest "/var/tmp/i3-gaps" "https://github.com/Airblader/i3"
cd "/var/tmp/i3-gaps" && {
  # Before we build, get the i3-gaps dependencies
  if ! apt-get install \
    libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev \
    libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev \
    libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev \
    libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev
  then
    echo "Failed to get i3-gaps dependency packages (stage 3) - aborting"
    exit 1
  fi
  # Build and install
  if ! {
    autoreconf --force --install && rm -rf build/ && mkdir -p build && cd build/ && \
      ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers && \
      make -j8 && make install
  }
  then
    echo "Failed building/installing i3-gaps - aborting"
    exit 1
  fi
}

# User config and updating of home config
if ! id -u "mkemp"
then
  # Add user, make home dir and symlink within home dir to the vboxshare dir
  useradd -m -U -s/bin/bash mkemp
  test -e /home/mkemp/vboxshare || ln -s /home/mkemp/vboxshare /mnt/vboxshare
fi

# Install plugins for vim
# In those cases where these are git repos, try to pull updates if they already exist
# Pathogen
if ! {
  mkdir -p /home/mkemp/.vim/autoload /home/mkemp/.vim/bundle && \
    curl -LSso /home/mkemp/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
}
then
  echo "Pathogen install failed - aborting"
  exit 1
fi
# Syntastic
git_get_latest "/home/mkemp/.vim/bundle/syntastic" "https://github.com/vim-syntastic/syntastic.git"
# Solarized colourscheme
git_get_latest "/home/mkemp/.vim/bundle/vim-colors-solarized" "https://github.com/altercation/vim-colors-solarized.git"
# Airline
git_get_latest "/home/mkemp/.vim/bundle/vim-airline" "https://github.com/vim-airline/vim-airline"
# Airline themes
git_get_latest "/home/mkemp/.vim/bundle/vim-airline-themes" "https://github.com/vim-airline-themes/vim-airline-themes"

# Fix permissions for vim plugins
chown -R mkemp:mkemp /home/mkemp/.vim

# Give mkemp sudo permissions
bash -c 'echo "mkemp ALL=(ALL:ALL) ALL" | (EDITOR="tee -a" visudo)'

# mkemp's password will need to be set manually by a user who can obtain root permissions.
# For a VirtualBox guest install, a manual re-installation of VirtualBox Guest Additions is
# also recommended at this point using an up-to-date guest additions ISO.

