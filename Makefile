NAME	= Inception

$(NAME) : all

all :
	sudo chmod 777 srcs/requirements/mariadb/tools/setup.sh
	sudo chmod 777 srcs/requirements/wordpress/tools/setup.sh
	sudo chmod 777 srcs/requirements/nginx/tools/setup.sh
	sudo chmod 777 srcs/requirements/mariadb/tools/db-create.sh
	sudo docker-compose -f srcs/docker-compose.yml up --force-recreate --build -d

clean :
	sudo docker-compose -f srcs/docker-compose.yml down

fclean :
	sudo docker-compose -f srcs/docker-compose.yml down
	sudo docker system prune --volumes --all --force
	sudo docker network prune --force
	sudo docker volume prune --force

re : fclean all

.PHONY: all clean fclean re
