all: mono-aarch6

mono-aarch6:
	sudo docker build -t superbfg7/mono-aarch6 .
	sudo docker tag superbfg7/mono-aarch6 superbfg7/mono-aarch6:`/usr/bin/pacman -Si mono | grep Version | sed -e "s/.* //"`
