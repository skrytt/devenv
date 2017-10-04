{% for pkg in ['git', 'vim', 'curl', 'wget', 'rsync', 'gcc', 'g++', 'make',
'python', 'python3', 'pylint', 'ruby', 'xserver-xorg', 'xinit', 'i3', 'feh',
'x11-xserver-utils', 'compton', 'rxvt-unicode', 'fonts-oxygen'] %}
{{ pkg }}:
  pkg:
    - installed
{% endfor %}
