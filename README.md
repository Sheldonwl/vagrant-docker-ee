# vagrant-docker-ee
This repository is for setting up a test Docker Enterprise Edition with UCP, DTR and worker node.

# Important
Create a folder named secrets and create a file named "ee_url" in that folder.  
Copy and paste your docker ee download url into that file. The docker-ee-install.sh script will use this file to download docker ee.
Vagrant will mount this file to /vagrant/secrets inside of the vm and then create the DOCKERURL environment variable, with the contents of that file as value. 
