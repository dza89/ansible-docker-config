docker run --rm -it -v $(pwd)/ansible:/ansible \
            -v ~/.ssh/id_rsa:/root/id_rsa \
            willhallonline/ansible:2.9-alpine ansible-playbook playbook.yml