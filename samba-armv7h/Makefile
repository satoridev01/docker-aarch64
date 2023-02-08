all: samba-aarch64

samba-aarch64: build tag

force: force-build tag

build:
	sudo docker build -t superbfg7/samba-aarch64 .

force-build:
	sudo docker build -t superbfg7/samba-aarch64 --no-cache .

tag: build
	sudo docker tag superbfg7/samba-aarch64 superbfg7/samba-aarch64:`/usr/bin/pacman -Si samba | grep Version | sed -e "s/.* //"`

create:
	sudo docker rename samba samba_old
	sudo docker create \
		--name=samba \
		-v /etc/localtime:/etc/localtime:ro \
		-v /data/fotos/:/fotos:ro \
		-v /data/music/:/music:ro \
		-p 139:139 \
		-p 445:445 \
		superbfg7/samba-aarch64
restart:
	sudo docker stop samba_old
	sudo docker start samba

cleanup:
	sudo docker rm samba_old

clean:
	sudo docker rm samba
	sudo docker rmi superbfg7/samba-aarch64

install:
	sudo cp -i samba.service /etc/systemd/system/
	@echo systemctl enable samba
	@echo systemctl start samba
