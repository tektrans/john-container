FROM := docker.io/kalilinux/kali-rolling:latest
TAG := ghcr.io/tektrans/john:latest

CREATED=`date --iso-8601=seconds -u`
REVISION=`git rev-parse HEAD`
VERSION=`date +%Y.%m.%d-%H%M`
TITLE=john
DESCRIPTION=Container for john the ripper, based on kalilinux/kali-roling
URL=https://github.com/tektrans/john-container

all:
	make build && make publish

build:
	echo '** PULL BASE IMAGE...'
	podman pull $(FROM)
	echo '** BUILDING...'
	podman build --pull=newer -t $(TAG) \
		--build-arg FROM=$(FROM) \
		--build-arg CREATED=$(CREATED) \
		--build-arg REVISION=$(REVISION) \
		--build-arg VERSION=$(VERSION) \
		--build-arg TITLE=$(TITLE) \
		--build-arg DESCRIPTION="$(DESCRIPTION)" \
		--build-arg URL=$(URL) \
		--annotation=org.opencontainers.image.title=$(TITLE) \
		--annotation=org.opencontainers.image.description="$(DESCRIPTION)" \
		--annotation=org.opencontainers.image.created="$(CREATED)" \
		--annotation=org.opencontainers.image.revision="$(REVISION)" \
		--annotation=org.opencontainers.image.version="$(VERSION)-$(REVISION)" \
		--annotation=org.opencontainers.image.url=$(URL) \
		--annotation=org.opencontainers.image.source=$(URL) \
		--annotation=org.opencontainers.image.authors="Adhidarma Hadiwinoto <adhisimon@tektrans.id>" \
		--annotation=org.opencontainers.image.vendor=TEKTRANS \
		--annotation=org.opencontainers.image.licenses=gpl3GPL-2.0-or-later \
		$(BUILD_ARGS) \
		.

publish:
	echo '** PUBLISHING...'
	podman push $(TAG)

clean:
	podman image rm $(TAG)
