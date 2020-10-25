# Configuring your machines for docker

This repository sets up any debian based os with ansible:

* installs docker and docker-compose-as-a-container
* set up public key sync with your github account
* adds a few basic tools (vim, git)
* hardens de ssh daemon

!! Be sure to have public keys on github or you will have to wait an hour after you upload them. 

Have docker installed on your local machine:

``` bash
## mandatory
# address of the server
ansible_ssh_host=''
# credentials for ansible to setup ssh connection
ansible_user=''
ansible_password='' # ansible_sudo_pass var is necessary when using a nonroot user
# your own user credentials in plaintext
system_username=''
system_password=''
# for example Europe/Amsterdam
timezone=''
# github username, all public keys will be synced with the server every hour
github_username=''

## optional
# mount for /var/lib/docker
docker_partition=''
# creates a spindown policy and installs hdparm when set to true
hdd_usage=''

docker run --rm -t --network host -e ANSIBLE_HOST_KEY_CHECKING=False \
        -w /ansible -v $(pwd)/ansible:/ansible \
        willhallonline/ansible:2.9-alpine ansible-playbook playbook.yml \
            --extra-vars "ansible_ssh_host=${ansible_ssh_host} ansible_user=${ansible_user} ansible_password=${ansible_password} \
                          system_username=${system_username} system_password=${system_password} hdd_usage=${hdd_usage} \
                          github_username=${github_username} docker_partition=${docker_partition} timezone=${timezone}"         
```
