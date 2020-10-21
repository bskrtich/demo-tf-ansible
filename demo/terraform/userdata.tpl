#cloud-config

# hostname
preserve_hostname: false
hostname: ${hostname}

# apt update
package_update: true
package_upgrade: true

users:
  - name: devops
    primary_group: devops
    groups: sudo
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    shell: /bin/bash
    passwd: $6$cei3hW18SG531rd$M.NtfEPNDV.32xu2jsXJKT5k.KvQN3cbZKadInRCHP5RgO5OyyvqEukpAx3lO.Cll83YEuIRQ/zpeDf4p/3EM.
    ssh_authorized_keys:
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDocLYcGjQ1qVTsn4/gQtsAxo+zqvTKb3yDFPg/3L689hxr0C4TzB/xXvUCK9fhBNNK21Z88FMND3XJcSBBdJohN9TeAscD6f45JzXUEjAwp1ItjD/vPbmHZlOJWiIZfRJEsnD4k5hTN0sCnt37keHQp+ugDgOM4/JYwisvl/eLm7Eg3WAnziIzyGtp2pRdkWg1bWZQTUzxIBp+o7jxBddPJyJRRKjZ4TgsgwOSz2OllCcW5JY39nYKX0fdn8OB0HWo63Qtv5/TefrU9f/NbhZabPY75zQrmgdL6NUyleP8WV5XqrwjLH/iWFJ29tyCLV1aMkRIvtc59O9sCllHkMfxz3Qh1yU63QVrq6FbZZLxclJGkSmSHB42+X7bcWF3StuxvSG08iAixIwcIn9lbhpBLynneK2y8YhQK2V4lZLCK00I9L6RakvPcyknEsGAUeVuluh9ZaXdPmbchMu8xtgLUU7qjcq6VEYdDqdXvRRGPBNBIbNJkxQ1qN22Upj0xL7R7bFRnXKPaIgQhAQzEktnCxDFL5N084XUB5PL6fgcLtD9LkxuBflIXx79PXPTteyISiU4pX0TRyg95n9rX86GAoYwofZk2GJVjF1I85o3bMnic9MQbgCwBSdaBMG8BFj19oXBcuLkgsvrfwou3WNiOMlbOZIJpK9ycET23oC7Fw== devops
