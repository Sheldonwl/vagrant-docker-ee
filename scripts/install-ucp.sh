#!/bin/bash

sudo docker image pull docker/ucp:latest

docker container run --rm -it --name ucp \
-v /var/run/docker.sock:/var/run/docker.sock \
docker/ucp:latest install \
--host-address 192.168.33.11 \
--admin-username admin \
--admin-password Welcome01 \
--pod-cidr 192.169.0.0/16 \
--san ucp-1.local \
 --force-minimums

# docker swarm join-token -q manager > /vagrant/secrets/swarm-join-token-mgr
# docker swarm join-token -q worker > /vagrant/secrets/swarm-join-token-worker
