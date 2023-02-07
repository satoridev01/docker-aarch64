PKGVER=$(shell cat Dockerfile | grep pkgver= | sed -e 's/.*=//')

all: radarr-aarch64

radarr-aarch64: build tag

force: force-build tag

build:
	sudo docker build \
		-t superbfg7/radarr-aarch64 \
		--build-arg "UID=`id -u kodi`" \
		--build-arg "GID=`id -g kodi`" .

force-build:
	sudo docker build --no-cache \
		-t superbfg7/radarr-aarch64 \
		--build-arg "UID=`id -u kodi`" \
		--build-arg "GID=`id -g kodi`" .

tag: build
	sudo docker tag superbfg7/radarr-aarch64 superbfg7/radarr-aarch64:${PKGVER}

create:
	sudo docker rename radarr radarr_old
	sudo docker create --name=radarr \
		-v /etc/localtime:/etc/localtime:ro \
		-v /opt/radarr/:/config \
		-v /data/video/nzb/:/data \
		-p 7878:7878\
		superbfg7/radarr-aarch64

restart:
	sudo docker stop radarr_old
	sudo docker start radarr

cleanup:
	sudo docker rm radarr_old

clean:
	sudo docker rm radarr
	sudo docker rmi superbfg7/radarr-aarch64

install:
	sudo cp -i radarr.service /etc/systemd/system/
	@echo systemctl enable radarr
	@echo systemctl start radarr
