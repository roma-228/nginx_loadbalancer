run:
	docker build -t mynginxload .
	docker container run -d -p 80:80 --name webserver  mynginxload
	docker network disconnect bridge webserver
	docker network connect my_network webserver
stop:
	docker rm -f  webserver
	docker image rm mynginxload
