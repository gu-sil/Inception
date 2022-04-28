NAME	= Inception

$(NAME) : all

all :
	sudo docker-compose -f srcs/docker-compose.yml up --force-recreate --build -d

clean :
	sudo docker-compose -f srcs/docker-compose.yml down

fclean :
	sudo docker-compose -f srcs/docker-compose.yml down
	sudo rm -rf srcs/vol_mariadb srcs/vol_wordpress

re : fclean all
