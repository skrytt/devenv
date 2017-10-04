/home/vagrant/.vim/autoload/pathogen.vim:
  file.copy:
    - source: /vboxshare/git-local-repos/pathogen/autoload/pathogen.vim
    - user: vagrant
    - group: vagrant
    - mode: 644
    - makedirs: True
    - force: True
    - require:
      - git: devenv_repo

{% for file in ['.i3/config', '.profile', '.vimrc', '.Xdefaults', '.xinitrc'] %}
/home/vagrant/{{ file }}:
  file.copy:
    - source: /vboxshare/devenv/config/home/{{ file }}
    - user: vagrant
    - group: vagrant
    - mode: 644
    - makedirs: True
    - force: True
    - require:
      - git: devenv_repo
{% endfor %}
