#!/bin/bash

sudo docker image pull docker/ucp:latest

echo "alias k=\"kubectl\"" >> ~/.bashrc
echo "alias kk=\"kubectl -n kube-system\"" >> ~/.bashrc

# RUN MANUALLY FOR NOW
#------------------------------------------------
# docker container run --rm -it --name ucp \
# -v /var/run/docker.sock:/var/run/docker.sock \
# docker/ucp:latest install \
# --host-address 192.168.33.11 \
# --admin-username admin \
# --admin-password ENTER_PASSWORD \
# --pod-cidr 192.169.0.0/16 \
# --san ucp-1.local \
#  --force-minimums
#------------------------------------------------

# docker swarm join-token -q manager > /vagrant/secrets/swarm-join-token-mgr
# docker swarm join-token -q worker > /vagrant/secrets/swarm-join-token-worker
