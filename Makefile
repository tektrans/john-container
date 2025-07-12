WP_VER=6.8.1
PHP_VER=8.4

TAG := ghcr.io/tektrans/john:latest

CREATED=`date --iso-8601=seconds -u`
REVISION=`git rev-parse HEAD`
TITLE=john
DESCRIPTION="Container for john the ripper, based on kalilinux/kali-roling"
URL=https://github.com/tektrans/john-container

all:
	make build && make publish

build:
	echo '** PULL BASE IMAGE...'
	podman pull $(FROM)
	echo '** BUILDING...'
	podman build --pull=newer -t $(TAG) \
		--build-arg CREATED=$(CREATED) \
		--build-arg REVISION=$(REVISION) \
		--build-arg TITLE=$(TITLE)
		--build-arg DESCRIPTION="$(DESCRIPTION)" \
		--build-arg URL=$(URL) \
		--annotation=org.opencontainers.image.title=$(TITLE) \
		--annotation=org.opencontainers.image.description="$(DESCRIPTION)" \
		--annotation=org.opencontainers.image.created="$(CREATED)" \
		--annotation=org.opencontainers.image.revision="$(REVISION)" \
		--annotation=org.opencontainers.image.url=$(URL) \
		--annotation=org.opencontainers.image.source=$(URL) \
		--annotation=org.opencontainers.image.authors="Adhidarma Hadiwinoto <adhisimon@tektrans.id>" \
		--annotation=org.opencontainers.image.vendor=TEKTRANS \
		--annotation=org.opencontainers.image.licenses=gpl3GPL-2.0-or-later \
		$(BUILD_ARGS) \
		. && \
	podman run --rm ${TAG} php --version > php-extensions.txt && \
	echo >> php-extensions.txt && \
	podman run --rm $(TAG) php -m >> php-extensions.txt && \
	podman run --rm $(TAG) apachectl -v > apache2-modules.txt 2>/dev/null && \
	echo >> apache2-modules.txt && \
	podman run --rm $(TAG) apachectl -M >> apache2-modules.txt 2>/dev/null

publish:
	echo '** PUBLISHING...'
	podman push $(TAG)

clean:
	podman image rm $(TAG)
