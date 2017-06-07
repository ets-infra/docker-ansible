FROM williamyeh/ansible:ubuntu16.04

MAINTAINER Eric Gazoni <eric@adimian.com>

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install git-core -y

# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]

