FROM alpine
RUN --mount=target=/mnt find /mnt && apk -X /mnt add ninjam-server
ENTRYPOINT ninjamsrv /etc/ninjam.cfg
