# Tool
sudo yum -y install git vim

# Docker
rpm --import https://download.docker.com/linux/centos/gpg
sudo curl -sSL https://get.docker.com/ | sh
sudo systemctl enable docker
sudo gpasswd -a vagrant docker 
sudo systemctl start docker

# Docker Compose
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

