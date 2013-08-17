gitlab
======

Single Server gitlab Deployment with postgresql database

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


This formula depends on the following formulas:

* `vim <https://github.com/saltstack-formulas/vim-formula>`_
* `postgresql <https://github.com/saltstack-formulas/postgresql-formula>`_