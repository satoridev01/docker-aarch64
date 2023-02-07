FROM scratch

ADD ArchLinuxARM-rpi-aarch64-latest.tar.gz /
COPY mirrorlist /etc/pacman.d/mirrorlist
COPY locale.nopurge /etc/locale.nopurge
COPY pacmaster.sh /usr/local/bin/

RUN pacman-key --init && \
	pacman-key --populate archlinuxarm && \
	pacman -Rns --noconfirm dhcpcd dialog firmware-raspberrypi linux-aarch64 nano net-tools \
				netctl openssh raspberrypi-bootloader uboot-raspberrypi vi which \
				wireless-regdb wireless_tools wpa_supplicant pcre && \
	pacman -Syu --noconfirm pwgen localepurge wget && \
	pwgen -s -1 16 | (read i; echo "$i"; echo "$i") | passwd && \
	userdel -f -r alarm && \
	pacmaster.sh -R packer pwgen && \
	rm -rf /var/cache/pacman/pkg/*

CMD ["/usr/local/bin/pacmaster.sh","-Syu"]
