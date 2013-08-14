gitlab
======

Single Server gitlab Deployment

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


This formula depends on the following formulas:

* `vim <https://github.com/saltstack-formulas/vim-formula>`_