# Init

## prerequisites

This repository sets up most devices with ansible, based on debian or ubuntu:

* install docker
* set up public key sync with your github account
* adds just a few basic tools (hdparm, vim, git)
* hardens de ssh daemon

!! After running this, you're not able to run it again, because it removes the possiblity to run ssh as root and login with password.
   If you want to add stuff don't run the sshd role yet.

!! Be sure to have to have public keys on github 

Have docker installed on your local machine:

``` bash
# creds for ansible to setup ssh connection
ansible_user=''
ansible_password=''
# for example Europe/Amsterdam
timezone=''
# for example /dev/sda1, if empty, does nothing
docker_partition=''
# your own user credentials in plaintext
system_username=''
system_password=''
# address of the server
ansible_ssh_host=''
# github username, all public_keys will be synced with the server every hour
github_username=''

docker run --rm -t --network host -e ANSIBLE_HOST_KEY_CHECKING=False \
        -w /ansible -v $(pwd)/ansible:/ansible \
        willhallonline/ansible:2.9-alpine ansible-playbook playbook.yml \
            --extra-vars "ansible_ssh_host=${ansible_ssh_host} ansible_user=${ansible_user} ansible_password=${ansible_password} \
                          system_username=${system_username} system_password=${system_password} \
                          github_username=${github_username} docker_partition=${docker_partition} timezone=${timezone}"
                          
```