gitlab
======

Single Server gitlab Deployment with postgresql database
running on localhost  

To customize gitlab:  
Edit config and replace gitlab_url
with something like 'http://domain.com/'
  $ sudo -u git -H vim /home/git/gitlab-shell/config.yml  

Make sure to change "localhost" to the fully-qualified domain name of your
host serving GitLab where necessary
  $ sudo -u git -H vim /home/git/gitlab/config/gitlab.yml      

And change "server" to the fully-qualified domain name of your
host serving GitLab where necessary
  $ sudo vim /etc/nginx/sites-available/gitlab      

Enable rack_attack by uncommenting the line 'config.middleware.use Rack::Attack'
  $ sudo -u git -H vim /home/git/gitlab/config/application.rb

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/topics/conventions/formulas.html>`_.

Available states
----------------

``gitlab``
  Installs gitlab full
``gitlab.packages``
  Installs gitlab depencies
``gitlab.user``
  Creates git user
``gitlab.gitlab-shell``
  Installs gitlab-shell from github
``gitlab.gitlab``
    Installs gitlab from github
``gitlab.gems``
    Installs prerequisite gems
``gitlab.postgres``
    Installs prerequisite postgresql database and service
``gitlab.nginx``
    Installs nginx webserver to serve gitlab    


This formula depends on the following formulas:

* `vim <https://github.com/saltstack-formulas/vim-formula>`_
* `postgresql <https://github.com/saltstack-formulas/postgresql-formula>`_
* `nginx <https://github.com/saltstack-formulas/nginx-formula>`_
