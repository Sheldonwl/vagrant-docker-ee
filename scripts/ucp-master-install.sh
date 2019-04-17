yum remove docker docker-client \
              docker-client-latest \
              docker-common \
              docker-latest \
              docker-latest-logrotate \
              docker-logrotate \
              docker-selinux \
              docker-engine-selinux \
              docker-engine \
              docker-ce

rm /etc/yum.repos.d/docker*.repo 

export DOCKERURL="https://storebits.docker.com/ee/trial/sub-7b258b77-2d6f-48df-ac74-b7894dd4a1fd"

sudo -E sh -c 'echo "$DOCKERURL/centos" > /etc/yum/vars/dockerurl'

yum install -y yum-utils device-mapper-persistent-data lvm2

sudo -E yum-config-manager \
--add-repo \
"$DOCKERURL/centos/docker-ee.repo"

#   Enable docker 18.09 repo
sudo yum-config-manager --disable docker-ee-stable-17.06
sudo yum-config-manager --enable docker-ee-stable-18.09

sudo yum -y install docker-ee

sudo systemctl start docker

sudo systemctl enable docker

sudo docker run hello-world

sudo usermod -aG docker vagrant

# sudo docker image pull docker/ucp

# docker container run --rm -it --name ucp \
# -v /var/run/docker.sock:/var/run/docker.sock \
# docker/ucp:latest install \
# --host-address 192.168.33.11 \
# --admin-username docker-admin \
# --admin-password Welcome01 \
# --pod-cidr 192.169.0.0/16 \
# --san dev.ucp.nl \
#  --force-minimums

