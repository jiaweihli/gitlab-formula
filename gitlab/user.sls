# user git required:
git:
  user.present:
    - fullname: Gitlab
    - home: /home/git
    - createhome: True
    
/home/git:
  file.directory:
    - user: git
    - mode: 755
    - makedirs: True
    - require:
      - user: git
 

git_config_name:
  cmd.run:
    - name: 'git config --global user.name "Gitlab"'
    - cwd: /home/git/
    - runas: git
    - require:
      - user: git
    
git_config_email:
  cmd.run:
    - name: 'git config --global user.email "gitlab@localhost"'
    - cwd: /home/git/
    - runas: git
    - require:
      - user: git