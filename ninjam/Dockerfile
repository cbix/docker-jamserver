FROM alpine
RUN --mount=target=/mnt apk -X /mnt/repo/packages add ninjam-server
ENTRYPOINT ninjamsrv /etc/ninjam.cfg
