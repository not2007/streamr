docker_install()
{
        echo "检查Docker......"
        docker -v
        if [ $? -eq  0 ]; then
                echo "检查到Docker已安装!"
        else
                echo "安装docker环境..."
                curl -fsSL https://get.docker.com | bash
                echo "安装docker环境...安装完成!"
        fi
        # 创建公用网络==bridge模式
        # docker network create share_network
}

docker_install

file_open_ulimit()
{
	sudo echo "* soft nproc 65535" >> /etc/security/limits.conf
	sudo echo "* hard nproc 65535" >> /etc/security/limits.conf
	sudo echo "ulimit -SHn 65535" >> /etc/profile
	sudo source /etc/profile
}
file_open_ulimit

sudo docker pull streamr/broker-node:testnet

mkdir ~/.streamrDocker01

curl ip.sb

sudo docker run -it -v $(cd ~/.streamrDocker01; pwd):/root/.streamr streamr/broker-node:testnet bin/config-wizard 
sudo docker container prune

sudo docker create --name st01 --restart=always -p 7170:7170 -p 7171:7171 -p 1881:1883 -v $(cd $HOME/.streamrDocker01; pwd):/root/.streamr streamr/broker-node:testnet

sudo docker start st01
