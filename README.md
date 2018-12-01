# harem

Opposed to what others may think, `HAREM` stands for High-Ansible-REM radiation,
and is just a personal use of Ansible to manage my home-office hardware
infrastructure.

While this is mostly aimed to my personal needs, like deploying and testing
OpenStack or its CI components, I would not mind receiving bug reports or
contributions.

To use it you may need to replace few encrypted variables with your own ones.

## Features

Powering up or down baremetal nodes:

    power <host> [on|off]

Reprovisioning a baremetal node:

    reprov <host> [os)_flavour]

Supported os flavors: ``centos7``, ``fedora28``,
``ubuntu-[bionic|trusty|xenial]``

## Hardware Components

- ``syno`` : Synology DSM
    - TFTP server
    - storage server (NFS/SMB/HTTP/...)
- ``router``: PfSense
    - DHCP server (tftp)
    - http proxy (squid)
    - reverse proxy (haproxy) doing SSL
- ``baremetals`` : Set of nodes that can be controlled over IPMI