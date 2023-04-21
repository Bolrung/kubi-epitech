start:
	docker compose -f docker-compose.yml up -d --build

start-apple:
	docker compose -f docker-compose.yml -f docker-compose.apple.yml up -d --build

stop:
	docker compose -f docker-compose.yml down

rm:
	docker compose -f docker-compose.yml rm