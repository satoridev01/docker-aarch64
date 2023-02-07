.PHONY: archlinux-aarch64 nzbget-aarch64 samba-aarch64
BASE = archlinux-aarch64
MONO = mono-aarch64
BUILD_MODULES = $(BASE) $(MONO) $(MODULES)
RESTART_MODULES = $(MODULES)
MODULES = $(BASE_MODULES) $(MONO_MODULES)
MONO_MODULES = nzbget-aarch64 samba-aarch64
BASE_MODULES = radarr-aarch64 sonarr-aarch64
PUSH_MODULES = $(BASE)-minimal $(MONO) $(MODULES)

DOCKER_USER = superbfg7

all: $(BUILD_MODULES)

clean:
	$(MAKE) -C archlinux-aarch64 clean

restart:
	for i in $(RESTART_MODULES); do \
		$(MAKE) -C $$i create restart cleanup; \
	done 

$(BASE):
	$(MAKE) -C $@

$(MONO): $(BASE)
	$(MAKE) -C $@

$(BASE_MODULES): $(BASE)
	$(MAKE) -C $@

$(MONO_MODULES): $(MONO)
	$(MAKE) -C $@

push:
	sudo docker login -u $(DOCKER_USER)
	for i in $(PUSH_MODULES); do \
		echo "----- pushing $$i"; \
		sudo docker push $(DOCKER_USER)/$$i; \
	done
