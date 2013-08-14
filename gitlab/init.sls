#{% if grains['os_family']=="Debian" %}

include:
  - vim
  - gitlab.packages

# user git required:
git:
  user.present:
    - fullname: Gitlab
    - home: /home/git
    
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
  file.copy
    - name: /home/git/gitlab-shell/config.yml
    - source: /home/git/gitlab-shell/config.yml.example
    - require:
      - git.latest: https://github.com/gitlabhq/gitlab-shell.git

gitlab-shell-install:
  cmd.run
    - name: /home/git/gitlab-shell/bin/install
    - cwd: /home/git/gitlab-shell/bin/
    - runas: git

# download gitlab and install
https://github.com/gitlabhq/gitlabhq.git:
  git.latest:
    - rev: 5-4-stable
    - target: /home/git
    - runas: git
    - unless: test -e /home/git/gitlab/config/gitlab.yml
    - require:
      - pkg: pkgs
      
/home/git/gitlab/config/gitlab.yml:
  file.copy
    - name: /home/git/gitlab/config/gitlab.yml
    - source: /home/git/gitlab/config/gitlab.yml.example
    - require:
      - git.latest: https://github.com/gitlabhq/gitlabhq.git

/home/git/gitlab/config/puma.rb:
  file.copy
    - name: /home/git/gitlab/config/puma.rb
    - source: /home/git/gitlab/config/puma.rb.example
    - require:
      - git.latest: https://github.com/gitlabhq/gitlabhq.git

/home/git/gitlab/log/
  file.directory:
    - user: git
    - file_mode: 744
    - dir_mode: 755
    - recurse:
      - user
      - group
      - mode
    - require:
      - file: /home/git/gitlab/config/gitlab.yml
      
/home/git/gitlab/tmp/
  file.directory:
    - user: git
    - file_mode: 744
    - dir_mode: 755
    - recurse:
      - user
      - group
      - mode
    - require:
      - file: /home/git/gitlab/config/gitlab.yml

/home/git/gitlab-satellites:
  file.directory:
    - user: git
    - file_mode: 744
    - dir_mode: 755
    - recurse:
      - user
      - group
      - mode
    - require:
      - file: /home/git/gitlab/config/gitlab.yml

/home/git/gitlab/tmp/pids:
  file.directory:
    - user: git
    - file_mode: 744
    - dir_mode: 755
    - recurse:
      - user
      - group
      - mode
    - require:
      - file: /home/git/gitlab/config/gitlab.yml
      
/home/git/gitlab/tmp/sockets:
  file.directory:
    - user: git
    - file_mode: 744
    - dir_mode: 755
    - recurse:
      - user
      - group
      - mode
    - require:
      - file: /home/git/gitlab/config/gitlab.yml

/home/git/gitlab/public/uploads:
  file.directory:
    - user: git
    - file_mode: 744
    - dir_mode: 755
    - recurse:
      - user
      - group
      - mode
    - require:
      - file: /home/git/gitlab/config/gitlab.yml

  