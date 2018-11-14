# install ansible

```
pip install ansible --user
```

# how tu run ?

```
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts site.yml --key-file "~/.ssh/ansible_rsa"
```

enjoy !
