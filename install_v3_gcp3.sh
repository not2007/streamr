mkdir ~/.streamrDocker01 ~/.streamrDocker02 ~/.streamrDocker03

curl ip.sb

sudo docker run -it -v $(cd ~/.streamrDocker01; pwd):/root/.streamr streamr/broker-node:testnet bin/config-wizard 
sudo docker run -it -v $(cd ~/.streamrDocker02; pwd):/root/.streamr streamr/broker-node:testnet bin/config-wizard
sudo docker run -it -v $(cd ~/.streamrDocker03; pwd):/root/.streamr streamr/broker-node:testnet bin/config-wizard 

sudo docker container prune

sudo docker create --name st01 --restart=always -p 7170:7170 -p 7171:7171 -p 1881:1883 -v $(cd $HOME/.streamrDocker01; pwd):/root/.streamr streamr/broker-node:testnet
sudo docker create --name st02 --restart=always -p 7270:7170 -p 7271:7171 -p 1882:1883 -v $(cd $HOME/.streamrDocker02; pwd):/root/.streamr streamr/broker-node:testnet
sudo docker create --name st03 --restart=always -p 7370:7170 -p 7371:7171 -p 1883:1883 -v $(cd $HOME/.streamrDocker03; pwd):/root/.streamr streamr/broker-node:testnet

sudo docker start st01 st02 st03
