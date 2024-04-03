# Set environment variable
ifeq ($(env), dev)
	environment := development
else ifeq ($(env), prod)
	environment := production
endif
	
# COMMANDS
start: is_env_defined
	@docker compose -f compose.$(env).yml up 
startd: is_env_defined
	@docker compose -f compose.$(env).yml up -d
restart: stop start
restartd: stop startd
stop: is_env_defined
	@docker compose -f compose.$(env).yml down
clean: is_env_defined
	@docker compose -f compose.$(env).yml down
	@docker container prune
	@docker rmi technicaltest-api

# REQUIREMENTS
is_env_defined:
	$(call check_defined, env)

