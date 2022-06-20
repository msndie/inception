# First of all, we need add domain names in hosts file, so it points to local IP address
#	sudo bash -c "echo '127.0.0.1 sclam.42.fr' >> /etc/hosts"
#	sudo bash -c "echo '127.0.0.1 www.sclam.42.fr' >> /etc/hosts"
# You may need this cmds ^
#========================================================================================
# sudo usermod -G wheel -a sclam <= for sudo in manjaro
#
# sudo usermod -a -G vboxsf sclam  |
###################################| <= for shared folder
# sudo chown -R sclam:users /share |
#
#========================================================================================

all: up_detached

up:
		docker-compose -f srcs/docker-compose.yml up --build;

up_detached:
		docker-compose -f srcs/docker-compose.yml up --build -d;

down:
		docker-compose -f srcs/docker-compose.yml down;

clean:
		sudo rm -rf /home/sclam/data/*;
		docker system prune -a;

.PHONY: all up up_detached down clean