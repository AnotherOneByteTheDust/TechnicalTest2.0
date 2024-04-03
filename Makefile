# Set environment variable
ifeq ($(env), dev)
	environment := development
else ifeq ($(env), prod)
	environment := production
endif

# Check that given variables are set and all have non-empty values,
# die with an error otherwise.
#
# Params:
#   1. Variable name(s) to test.
#   2. (optional) Error message to print.
check_defined = \
    $(strip $(foreach 1,$1, \
        $(call __check_defined,$1,$(strip $(value 2)))))
__check_defined = \
    $(if $(value $1),, \
      $(error Undefined variable: $1$(if $2, ($2))))

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
	@docker rmi technicaltest-backend
	@docker rmi technicaltest-nginx

# REQUIREMENTS
is_env_defined:
	$(call check_defined, env)

