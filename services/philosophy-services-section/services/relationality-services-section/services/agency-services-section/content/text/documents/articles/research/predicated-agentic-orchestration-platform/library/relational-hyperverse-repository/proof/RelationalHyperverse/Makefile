IMAGE     := relational-hyperverse-proof
CONTAINER := rh-lean-dev

.PHONY: build up down exec check shell ci clean

## build: build the dev image (installs Lean toolchain + Mathlib olean cache)
build:
	docker build -t $(IMAGE) .

## up: start the persistent dev container with source bind-mounted.
##   The container stays running until you call `make down`.
up: build
	@docker inspect $(CONTAINER) > /dev/null 2>&1 && echo "Container already running." || \
	  docker run -d --name $(CONTAINER) \
	    -v "$(CURDIR):/project" \
	    -w /project \
	    $(IMAGE)
	@echo "Container $(CONTAINER) is up. Use 'make exec' to open a shell."

## exec: open a bash shell inside the running dev container.
exec:
	docker exec -it $(CONTAINER) bash

## check: run lake build inside the running container.
check:
	docker exec $(CONTAINER) lake build

## down: stop and remove the dev container.
down:
	-docker stop $(CONTAINER)
	-docker rm $(CONTAINER)

## shell: one-shot interactive shell (does not persist).
shell: build
	docker run --rm -it \
	  -v "$(CURDIR):/project" \
	  -w /project \
	  $(IMAGE) bash

## ci: clean rebuild from scratch (no cache) — mirrors what CI does.
ci:
	docker build --no-cache -t $(IMAGE)-ci .

## clean: stop container, remove image.
clean: down
	-docker rmi $(IMAGE) $(IMAGE)-ci 2>/dev/null
