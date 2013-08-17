# download gitlab-shell and install
include:
  - gitlab.user
  - gitlab.packages

https://github.com/gitlabhq/gitlab-shell.git:
  git.latest:
    - rev: v1.5.0
    - target: /home/git
    - runas: git
    - unless: test -e /home/git/gitlab-shell/config.yml
    - require:
      - pkg: gitlab-pkgs
      - user: git
      - file: /home/git

/home/git/gitlab-shell/config.yml:
  file.copy:
    - name: /home/git/gitlab-shell/config.yml
    - source: salt://gitlab/config.yml
    - require:
      - git.latest: https://github.com/gitlabhq/gitlab-shell.git

gitlab-shell-install:
  cmd.run:
    - name: /home/git/gitlab-shell/bin/install
    - cwd: /home/git/gitlab-shell/bin/
    - runas: git
    - require:
      - file: /home/git/gitlab-shell/config.yml 