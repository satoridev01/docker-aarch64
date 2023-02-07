all: archlinux-aarch64-minimal.tar.gz

ArchLinuxARM-rpi-aarch64-latest.tar.gz:
	wget http://os.archlinuxarm.org/os/ArchLinuxARM-rpi-aarch64-latest.tar.gz
	sudo docker build --no-cache -t superbfg7/archlinux-aarch64 .

archlinux-aarch64-minimal.tar.gz: ArchLinuxARM-rpi-aarch64-latest.tar.gz
	sudo docker run --name=archlinux-aarch64-base superbfg7/archlinux-aarch64
	sudo docker export archlinux-aarch64-base > archlinux-aarch64-minimal.tar
	sudo docker import archlinux-aarch64-minimal.tar superbfg7/archlinux-aarch64-minimal
	sudo docker tag superbfg7/archlinux-aarch64-minimal superbfg7/archlinux-aarch64-minimal:`date +%F`
	gzip archlinux-aarch64-minimal.tar

clean:
	rm -f archlinux-aarch64-minimal.tar.gz
	sudo docker rm archlinux-aarch64-base

proper: clean
	rm -f ArchLinuxARM-rpi-aarch64-latest.tar.gz
	sudo docker rmi superbfg7/archlinux-aarch64
