FROM williamyeh/ansible:ubuntu16.04

MAINTAINER Eric Gazoni <eric@adimian.com>

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && apt-get install git-core python3-pip jq curl -y

RUN cd ~/ && curl -sL https://deb.nodesource.com/setup_8.0 -o nodesource_setup.sh
RUN chmod +x ~/nodesource_setup.sh
RUN ~/nodesource_setup.sh

RUN pip install "ansible>=2.7.9" "ansible_vault>=1.2.0" "boto>=2.49.0" "boto3==1.9.126" "botocore==1.12.134" "awscli==1.16.144" "influxdb==5.0.0"

# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]

