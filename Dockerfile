FROM williamyeh/ansible:ubuntu16.04

MAINTAINER Eric Gazoni <eric@adimian.com>

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install git-core python3-pip -y

# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]

