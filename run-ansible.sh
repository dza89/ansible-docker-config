docker run --rm -it --network host \
    -w /ansible \
    -v $(pwd)/ansible:/ansible \
    willhallonline/ansible:2.9-alpine \
            --extra-vars upassword=${UPASSWORD} uusername=${UUSERNAME} ansible_ssh_pass=${ssh_pass} \
                         ansible_ssh_host=${MYIP}
            playbook.yml 