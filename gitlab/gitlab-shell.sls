# download gitlab-shell and install

https://github.com/gitlabhq/gitlab-shell.git:
  git.latest:
    - rev: v1.5.0
    - target: /home/git
    - runas: git
    - unless: test -e /home/git/gitlab-shell/config.yml
    - require:
      - pkg: pkgs

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