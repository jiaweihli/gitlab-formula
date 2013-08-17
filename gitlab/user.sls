# user git required:
git:
  user.present:
    - fullname: Gitlab
    - home: /home/git
    - createhome: True


/home/git:
  file.directory:
    - user: git
    - group: users
    - mode: 755
    - require:
      - user: git     
    

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