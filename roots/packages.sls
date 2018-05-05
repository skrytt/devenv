{% for pkg in ['git', 'vim', 'curl', 'wget', 'rsync', 'gcc', 'g++', 'make', 'python', 'python3',
'python3-virtualenv', 'pylint', 'shellcheck', 'elixir', 'ruby', 'xserver-xorg', 'xinit', 'i3', 
'feh', 'x11-xserver-utils', 'compton', 'rxvt-unicode', 'fonts-oxygen', 'dos2unix'] %}
{{ pkg }}:
  pkg:
    - installed
{% endfor %}
