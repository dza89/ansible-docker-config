# Init

This repository sets up the odroid xu4 with ansible, based on debian but should work on ubuntu as well.
!! After running this, you're not able to run it again, because it removes the possiblity to run ssh as root.
   If you want to add stuff don't run the sshd role yet.

Make sure:
- to replace the public keys in ansible/roles/sshd/public_keys

Additionaly:
- mount a separate partition on /mnt/docker, and it will use that as rootvolume for docker


Have docker installed on your local machine:

``` bash
export \
# creds for ansible to setup ssh connection
    ansible_user='' \
    ansible_password='' \
# for example Europe/Amsterdam
    timezone='' \
# for example /dev/sda1, if empty, does nothing
    docker_partition='' \
# your own user credentials in plaintext
    system_username='' \
    system_password='' \
# address of the server
    ansible_ssh_host='' \
# github username, all public_keys will be synced with the server every hour
    github_username=''

docker run --rm -t --network host -e ANSIBLE_HOST_KEY_CHECKING=False \
        -w /ansible -v $(pwd)/ansible:/ansible \
        willhallonline/ansible:2.9-alpine ansible-playbook playbook.yml -vvv \
            --extra-vars "system_password=${system_password} system_username=${system_username} ansible_password=${ansible_password} \
                        ansible_ssh_host=${ansible_ssh_host} ansible_user=${ansible_user} github_username=${github_username} \
                        docker_partition=${docker_partition} timezone=${timezone}
```