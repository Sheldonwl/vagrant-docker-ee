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

# curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
# chmod +x ./kubectl
# sudo mv ./kubectl /usr/local/bin/kubectl

# #OR run as SUDO
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

