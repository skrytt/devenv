if [ "$(id -u)" != "0" ]; then
  echo "Script must run as root user"
  exit 1
fi

salt-call --local --file-root=salt/roots --pillar-root=salt/pillar state.apply
