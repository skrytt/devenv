{% for repo_name, repo_url in [
  ('devenv', 'https://github.com/skrytt/devenv'),
  ('pathogen', 'https://github.com/tpope/vim-pathogen'),
] %}
{{ repo_name }}_repo:
  git.latest:
    - name: {{ repo_url }}
    - target: '/vboxshare/git-local-repos/{{ repo_name }}'
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
    - target: '/home/vagrant/.vim/bundle/{{ repo_name }}'
    - require:
      - file: /home/vagrant/.vim/autoload/pathogen.vim
{% endfor %}
