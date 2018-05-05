{% for repo_name, repo_url in [
  ('devenv', 'https://github.com/skrytt/devenv'),
  ('pathogen', 'https://github.com/tpope/vim-pathogen'),
] %}
{{ repo_name }}_repo:
  git.latest:
    - name: {{ repo_url }}
    - target: '{{ pillar['git_local_repos_dir'] }}/{{ repo_name }}'
{% endfor %}

{% for repo_name, repo_url in [
  ('syntastic', 'https://github.com/vim-syntastic/syntastic.git'),
  ('vim-colors-solarized', 'https://github.com/altercation/vim-colors-solarized.git'),
  ('vim-airline', 'https://github.com/vim-airline/vim-airline'),
  ('vim-airline-themes', 'https://github.com/vim-airline/vim-airline-themes'),
  ('vim-elixir', 'https://github.com/elixir-lang/vim-elixir'),
] %}
{{ repo_name }}_repo:
  git.latest:
    - name: {{ repo_url }}
    - target: '/home/{{ pillar['target_user'] }}/.vim/bundle/{{ repo_name }}'
    - require:
      - file: /home/{{ pillar['target_user'] }}/.vim/autoload/pathogen.vim
{% endfor %}
