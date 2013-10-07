# download gitlab and install
include:
  - gitlab.user
  - gitlab.packages

https://github.com/gitlabhq/gitlabhq.git:
  git.latest:
    - rev: 6-1-stable
    - target: /home/git
    - runas: git
    - unless: test -e /home/git/gitlab/config/gitlab.yml
    - require:
      - pkg: gitlab-pkgs
      - user: git
      - file: /home/git
      
/home/git/gitlab/config/gitlab.yml:
  file.copy:
    - name: /home/git/gitlab/config/gitlab.yml
    - source: /home/git/gitlab/config/gitlab.yml.example
    - require:
      - git.latest: https://github.com/gitlabhq/gitlabhq.git

/home/git/gitlab/config/puma.rb:
  file.copy:
    - name: /home/git/gitlab/config/puma.rb
    - source: /home/git/gitlab/config/puma.rb.example
    - require:
      - git.latest: https://github.com/gitlabhq/gitlabhq.git

/home/git/gitlab/config/initializers/rack_attack.rb
  file.copy:
    - name: /home/git/gitlab/config/initializers/rack_attack.rb
    - source: /home/git/gitlab/config/initializers/rack_attack.rb.example
    - require:
      - git.latest: https://github.com/gitlabhq/gitlabhq.git

/home/git/gitlab/log:
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
      
/home/git/gitlab/tmp:
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

/etc/init.d/gitlab:
  file.copy:
    - name: /etc/init.d/gitlab
    - source: /home/git/gitlab/lib/support/init.d/gitlab
    - user: root
    - group: root
    - mode: 0644
    - require:
      - git.latest: https://github.com/gitlabhq/gitlabhq.git