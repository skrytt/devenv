/home/{{ pillar['target_user'] }}/.vim/autoload/pathogen.vim:
  file.copy:
    - source: {{ pillar['git_local_repos_dir'] }}/pathogen/autoload/pathogen.vim
    - user: {{ pillar['target_user'] }}
    - group: {{ pillar['target_user'] }}
    - mode: 644
    - makedirs: True
    - force: True

{% for file in ['.i3/config', '.profile', '.bashrc', '.vimrc', '.Xdefaults', '.xinitrc'] %}
/home/{{ pillar['target_user'] }}/{{ file }}:
  file.copy:
    - source: config/home/{{ file }}
    - user: {{ pillar['target_user'] }}
    - group: {{ pillar['target_user'] }}
    - mode: 644
    - makedirs: True
    - force: True
{% endfor %}
