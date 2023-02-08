FROM superbfg7/archlinux-aarch64-minimal

RUN pacmaster.sh -Syu samba 

# add config file
COPY smb.conf /etc/samba/smb.conf

# set volumes
VOLUME /fotos /music

# expose ports
EXPOSE 139 445

CMD exec ionice -c 3 smbd -F --no-process-group < /dev/null
