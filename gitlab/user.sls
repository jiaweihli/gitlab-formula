# user git required:
/home/git:
  file.directory:
    - mode: 755
    - makedirs: True

git:
  user.present:
    - fullname: Gitlab
    - home: /home/git
    - createhome: True
    - require: 
      - file: /home/git
    

git_config_name:
  cmd.run:
    - name: 'git config --global user.name "Gitlab"'
    - cwd: /home/git/
    - user: git
    - runas: git
    - require:
      - user: git
      - file: /home/git      
    
git_config_email:
  cmd.run:
    - name: 'git config --global user.email "gitlab@localhost"'
    - cwd: /home/git/
    - user: git
    - runas: git
    - require:
      - user: git
      - file: /home/git      