FROM williamyeh/ansible:ubuntu18.04

MAINTAINER Kenny Van de Maele <kenny@adimian.com>

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && apt remove python -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install git-core python3-pip python3-psycopg2 jq curl postgresql -y \
    && apt autoremove -y \
    && ln -fs /usr/bin/pip3 /usr/bin/pip \
    && ln -fs /usr/bin/python3 /usr/bin/python
    

RUN pip3 install "ansible>=2.7.9" "ansible_vault>=1.2.0" "boto>=2.49.0" "boto3==1.16.19" "botocore==1.19.19" "awscli==1.18.179" "influxdb==5.3.1"
RUN ansible-galaxy collection install community.general
RUN ansible-galaxy collection install ansible.posix

# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]
