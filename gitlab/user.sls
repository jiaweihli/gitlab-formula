# user git required:
git:
  user.present:
    - fullname: Gitlab
    - home: /home/git
    - createhome: True

git_config_name:
  cmd.run:
    - name: 'git config --global user.name "Gitlab"'
    - cwd: /home/git/
    - runas: git
    
git_config_email:
  cmd.run:
    - name: 'git config --global user.email "gitlab@localhost"'
    - cwd: /home/git/
    - runas: git