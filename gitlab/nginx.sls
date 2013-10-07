include:
  - nginx
  - gitlab.gitlab
  
nginx-server:
  pkg:
    - installed
    - name: nginx

/etc/nginx/sites-available/gitlab:
  file.copy:
    - name: /etc/nginx/sites-available/gitlab
    - source: /home/git/gitlab/lib/support/nginx/gitlab
    - require:
      - git.latest: https://github.com/gitlabhq/gitlabhq.git
  file.sed:
    - before: 'server_name YOUR_SERVER_FQDN'
    - after: "server_name {{ fqdn }}"
    - limit: ';'

/etc/nginx/sites-enabled/gitlab:
  file.symlink:
    - target: /etc/nginx/sites-available/gitlab
    - require: 
      -file: /etc/nginx/sites-available/gitlab 

nginx-server-2:
  service:
    - running
    - enable: True
    - name: nginx
    - require:
      - file: /etc/nginx/sites-enabled/gitlab 
