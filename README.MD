# Init

This repository sets up the odroid xu4 with ansible, based on debian but should work on ubuntu as well.

Make sure:
- to replace the public keys in ansible/roles/sshd/public_keys

Additionaly:
- mount a separate partition on /mnt/docker, and it will use that as rootvolume for docker
