# harem

## Components

- ``syno`` : Synology DSM
    - tftp server
    - storage server (NFS/SMB/HTTP/...)
- ``router``: PfSense
    - dhcp server (tftp)
    - http proxy (squid)
    - reverse proxy (haproxy) doing SSL
