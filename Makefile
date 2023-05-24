all: volume
		docker compose -f ./srcs/docker-compose.yml up --build

volume:
		mkdir -p /home/jrossett/data/mariadb
		mkdir -p /home/jrossett/data/wordpress

stop:
		docker compose -f ./srcs/docker-compose.yml stop

clean:
		docker compose -f ./srcs/docker-compose.yml down


fclean: clean
		docker system prune --all --force --volumes

re: fclean all

.PHONY: all volume stop clean fclean re