FROM docker:17.09

ARG DOCKER_MACHINE_VERSION=0.13.0

RUN set -ex; \
	apk add --no-cache --virtual .fetch-deps \
		curl \
	; \
	\
	if ! curl -L https://github.com/docker/machine/releases/download/v${DOCKER_MACHINE_VERSION}/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine; then \
		echo >&2 "error: failed to download 'docker-${DOCKER_MACHINE_VERSION}'"; \
		exit 1; \
	fi; \
	\
	chmod +x /tmp/docker-machine; \
    cp /tmp/docker-machine /usr/local/bin/docker-machine; \
	\
	apk del .fetch-deps;