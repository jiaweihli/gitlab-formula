include: 
  - gitlab.gems
  - gitlab.gitlab
  - postgresql
  
gitlab_database:
  pkg:
    - installed
    - name: postgresql
  service:
    - running
    - enable: True
    - name: postgresql
  postgres_user:
    - name: git
    - password: gitlab
  postgres_database:
    - name: gitlabhq_production
    - template: template1
    - owner: git

/home/git/gitlab/config/database.yml:
  file.managed:
    - name: /home/git/gitlab/config/database.yml
    - source: salt://gitlab/database.yml
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
        - gem: bundler
        - gem: charlock_holmes
        - file: /home/git/gitlab/config/database.yml
        - service: postgresql

create_gitlab_database:
  cmd.wait:
    - name: "bundle exec rake gitlab:setup RAILS_ENV=production"
    - cwd: /home/git
    - runas: git
    - require:
      - cmd: install_gitlab_postgresql           