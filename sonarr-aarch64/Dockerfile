FROM superbfg7/mono-aarch6

ENV pkgver=3.0.9.1549
ENV pkg="Sonarr.main.${pkgver}.linux.tar.gz"
ENV source="https://download.sonarr.tv/v3/main/${pkgver}/${pkg}"

ARG UID
ARG GID

RUN	wget "${source}" && \
		tar xzfv "${pkg}" && \
		rm -rf "/Sonarr/Sonarr.Update" && \
		groupadd -r -o -g $GID sonarr && \
		useradd -r -o -u $UID -g sonarr -s /bin/false sonarr && \
		rm -f "${pkg}"

USER $UID

# Volumes and Ports
VOLUME /config /data
EXPOSE 8989

CMD ["/usr/bin/mono", "/Sonarr/Sonarr.exe", "-nobrowser", "-data=/config"]
