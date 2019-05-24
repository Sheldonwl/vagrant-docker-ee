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

export DOCKERURL=$(cat /vagrant/secrets/ee_url)

sudo -E sh -c 'echo "$DOCKERURL/centos" > /etc/yum/vars/dockerurl'

yum install -y yum-utils device-mapper-persistent-data lvm2

sudo -E yum-config-manager \
--add-repo \
"$DOCKERURL/centos/docker-ee.repo"

# Enable docker 18.09 repo
sudo yum-config-manager --disable docker-ee-stable-17.06
sudo yum-config-manager --enable docker-ee-stable-18.09

# Install docker ee
sudo yum -y install docker-ee
sudo systemctl start docker
sudo systemctl enable docker
sudo docker run hello-world
sudo usermod -aG docker vagrant

# TODO: Better dns implementation
#-------------------------------------------------------------
# Set DNS entries
sudo echo "192.168.33.11 ucp-1.local" >> /etc/hosts
# sudo echo "192.168.33.12 ucp-2.local" >> /etc/hosts
# sudo echo "192.168.33.13 ucp-3.local" >> /etc/hosts
sudo echo "192.168.33.101 node-1.local" >> /etc/hosts
sudo echo "192.168.33.102 node-2.local" >> /etc/hosts
# sudo echo "192.168.33.103 node-3.local" >> /etc/hosts
sudo echo "192.168.33.111 dtr-1.local" >> /etc/hosts
# sudo echo "192.168.33.112 dtr-2.local" >> /etc/hosts
# sudo echo "192.168.33.113 dtr-3.local" >> /etc/hosts

if [ "$HOSTNAME" = "ucp-1" ]; then
    sudo cp /vagrant/scripts/install-ucp.sh .
    sudo chmod +x install-ucp.sh
    ./install-ucp.sh
elif [ "$HOSTNAME" = "node-1" -o "$HOSTNAME" = "node-2" ]; then
    sudo cp /vagrant/scripts/install-node.sh .
    sudo chmod +x install-node.sh
    ./install-node.sh
elif [ "$HOSTNAME" = "dtr-1" ]; then
    sudo cp /vagrant/scripts/install-dtr.sh .
    sudo chmod +x install-dtr.sh
    ./install-dtr.sh
fi
#-------------------------------------------------------------

echo "alias k=\"kubectl\"" >> ~/.bashrc
echo "alias kk=\"kubectl -n kube-system\"" >> ~/.bashrc
