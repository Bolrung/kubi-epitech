up:
	docker compose -f docker-compose.dev.yml up -d --build

up-arm:
	docker compose -f docker-compose.dev.yml -f docker-compose.arm.yml up -d --build

stop:
	docker compose -f docker-compose.dev.yml down

rm:
	docker compose -f docker-compose.dev.yml rm