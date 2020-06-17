SUPPORTED_COMMANDS := rails bundle rubocop rubocop-auto-correct fasterer rubycritic rspec
SUPPORTS_MAKE_ARGS := $(findstring $(firstword $(MAKECMDGOALS)), $(SUPPORTED_COMMANDS))
ifneq "$(SUPPORTS_MAKE_ARGS)" ""
  COMMAND_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(COMMAND_ARGS):;@:)
endif

# Container and services rules

start:
	@docker-compose start

stop:
	@docker-compose stop

up:
	@docker-compose up

up-build:
	@docker-compose up --build

up-d:
	@docker-compose up -d

down:
	@docker-compose down -v

restart:
	@docker-compose restart

reset:
	@docker-compose down -v
	@docker-compose up -d

# Container or service log rules

logs:
	@docker-compose logs --tail 10 -f

app-log:
	@docker-compose logs --tail 20 -f app

db-log:
	@docker-compose logs --tail 20 -f mongodb

# App service helpers rules

bundle:
	@docker-compose exec app ${MAKECMDGOALS}

rails:
	@docker-compose exec app bundle exec ${MAKECMDGOALS}

rubocop:
	@docker-compose exec app bundle exec ${MAKECMDGOALS}

rubocop-auto-correct:
	@docker-compose exec app bundle exec rubocop -a ${COMMAND_ARGS}

fasterer:
	@docker-compose exec app bundle exec ${MAKECMDGOALS}

rubycritic:
	@docker-compose exec app bundle exec ${MAKECMDGOALS}

rspec:
	@docker-compose exec app bundle exec ${MAKECMDGOALS}

# Database service helpers rules

db_console:
	@docker-compose exec mongodb mongo

# App container access

sh:
	@docker-compose exec app sh

bash:
	@docker-compose exec app bash

# Only for POC branch

deploy:
	@git push heroku POC:master

