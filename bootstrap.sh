#!/bin/bash
set -e
set -x
useradd -s /bin/bash -d /opt/stack -m stack
echo "stack ALL=(ALL) NOPASSWD: ALL" >>/etc/sudoers
su - stack
git clone git://github.com/openstack-dev/devstack.git
cd devstack
cat <<EOF >local.conf
[[local|localrc]]
ADMIN_PASSWORD=admin
DATABASE_PASSWORD=\$ADMIN_PASSWORD
RABBIT_PASSWORD=\$ADMIN_PASSWORD
SERVICE_PASSWORD=\$ADMIN_PASSWORD
HOST_IP=192.168.56.10
FLOATING_RANGE=192.168.56.224/27
FLAT_INTERFACE=enp0s9
EOF
./stack.sh
echo "Horizon is being port-forwarded to http://127.0.0.1:8000"
