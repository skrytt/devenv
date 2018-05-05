if [ "$(id -u)" != "0" ]; then
  echo "Script must run as root user"
  exit 1
fi

if [ ! -d "salt" ] || [ ! -d "salt/roots" ]; then
  echo "No salt/roots directory found"
  exit 1
fi

if [ ! -d "salt/pillar" ]; then
  echo "No salt/pillar directory found"
  exit 1
fi

salt-call --local --file-root=salt/roots --pillar-root=salt/pillar state.apply
