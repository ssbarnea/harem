# DSM Role

Configures Synology DSM to act as:

- TFTP server boostrapping linux baremetals
- installing SSL certificates
- allow DSM docker to be accessible using TCP

References:

- https://www.syslinux.org/wiki/index.php?title=PXELINUX

## Requirements

A DSM 6.2 or newer machine named "syno" or inside "syno" group,

## Role Variables

http_proxy
cert_name

## Dependencies

N/A

## Example Playbook

    - hosts: servers
      roles:
         - { role: dsm, x: 42 }

## License

BSD

## Author Information

Sorin Sbarnea
