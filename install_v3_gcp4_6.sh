mkdir ~/.streamrDocker04 ~/.streamrDocker05 ~/.streamrDocker06

sudo docker run -it -v $(cd ~/.streamrDocker04; pwd):/root/.streamr streamr/broker-node:testnet bin/config-wizard
sudo docker run -it -v $(cd ~/.streamrDocker05; pwd):/root/.streamr streamr/broker-node:testnet bin/config-wizard
sudo docker run -it -v $(cd ~/.streamrDocker06; pwd):/root/.streamr streamr/broker-node:testnet bin/config-wizard

sudo docker create --name st04 --restart=always -p 7470:7170 -p 7471:7171 -p 1884:1883 -v $(cd $HOME/.streamrDocker04; pwd):/root/.streamr streamr/broker-node:testnet 
sudo docker create --name st05 --restart=always -p 7570:7170 -p 7571:7171 -p 1885:1883 -v $(cd $HOME/.streamrDocker05; pwd):/root/.streamr streamr/broker-node:testnet
sudo docker create --name st06 --restart=always -p 7670:7170 -p 7671:7171 -p 1886:1883 -v $(cd $HOME/.streamrDocker06; pwd):/root/.streamr streamr/broker-node:testnet 

sudo docker start st04 st05 st06

curl ip.sb
