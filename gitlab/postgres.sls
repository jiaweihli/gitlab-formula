include: 
  - gitlab.gems
  - gitlab.gitlab
  - postgresql
  
gitlab_database:
  service:
    - running
    - enable: True
    - names:
      - postgresqld

/home/git/gitlab/config/database.yml:
  file.copy:
    - name: /home/git/gitlab/config/database.yml
    - source: /home/git/gitlab/config/database.yml.postgresql
    - user: git
    - group: git
    - mode: 744
    - require:
      - git.latest: https://github.com/gitlabhq/gitlabhq.git
      
install_gitlab_postgresql:
  cmd.run:
    - name: "bundle install --deployment --without development test mysql unicorn aws"
    - cwd: /home/git/
    - runas: git        
    - require:
        - gem: 
          - bundler
          - charlock_holmes
        - file: /home/git/gitlab/config/database.yml
        - service: postgresqld

create_gitlab_database:
  cmd.wait:
    - name: "bundle exec rake gitlab:setup RAILS_ENV=production"
    - cwd: /home/git
    - runas: git
    - require:
      - cmd: install_gitlab_postgresql           