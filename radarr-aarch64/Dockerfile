FROM superbfg7/mono-aarch6

ENV pkgver=4.3.2.6857
ENV pkg="Radarr.master.${pkgver}.linux-core-arm64.tar.gz"
ENV source="https://github.com/Radarr/Radarr/releases/download/v${pkgver}/${pkg}"

ARG UID
ARG GID

RUN	pacmaster.sh -Syu --noconfirm wget && wget "${source}" && \
		tar xzfv "${pkg}" && \
		rm -rf "/Radarr/Radarr.Update" && \
		groupadd -r -o -g $GID radarr && \
		useradd -r -o -u $UID -g radarr -s /bin/false radarr && \
		rm -f "${pkg}"

USER $UID

# Volumes and Ports
VOLUME /config /data
EXPOSE 7878

CMD ["/Radarr/Radarr", "-nobrowser", "-data=/config"]
