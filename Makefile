build:
	docker build -t msmtp.ca.wordpress .

install:
	docker-compose up -d
