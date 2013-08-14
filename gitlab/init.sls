#{% if grains['os_family']=="Debian" %}

include:
  - vim
  - gitlab.packages
  - gitlab.user
  - gitlab.gitlab-shell
  - gitlab.gitlab