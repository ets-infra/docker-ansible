FROM williamyeh/ansible:ubuntu18.04

MAINTAINER Eric Gazoni <eric@adimian.com>

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && apt remove python -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install git-core python3-pip python3-psycopg2 jq curl postgresql -y \
    && apt autoremove -y \
    && ln -fs /usr/bin/pip3 /usr/bin/pip \
    && ln -fs /usr/bin/python3 /usr/bin/python
    

RUN pip3 install "ansible>=2.7.9" "ansible_vault>=1.2.0" "boto>=2.49.0" "boto3==1.9.126" "botocore==1.12.134" "awscli==1.18.133" "influxdb==5.0.0"

# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]
