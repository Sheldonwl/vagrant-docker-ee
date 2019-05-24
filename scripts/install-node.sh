#!/bin/bash

echo "alias k=\"kubectl\"" >> ~/.bashrc
echo "alias kk=\"kubectl -n kube-system\"" >> ~/.bashrc

# RUN MANUALLY FOR NOW
#------------------------------------------------
# cat <<EOF > /etc/yum.repos.d/kubernetes.repo
# [kubernetes]
# name=Kubernetes
# baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
# enabled=1
# gpgcheck=1
# repo_gpgcheck=1
# gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
# EOF

# sudo yum install -y kubectl

# ex +'/BEGIN CERTIFICATE/,/END CERTIFICATE/p' <(echo | openssl s_client -showcerts -connect 192.168.33.11:443) -scq > dtr.crt
# sudo cp dtr.crt /etc/pki/ca-trust/source/
# sudo cp dtr.crt /etc/pki/ca-trust/source/anchors/
# sudo update-ca-trust extract
#------------------------------------------------

# TODO
# export SWARM_JOIN_TOKEN=$(cat /vagrant/secrets/swarm-join-token-worker)
# docker swarm join --token ${SWARM_JOIN_TOKEN} 192.168.33.11:2377
