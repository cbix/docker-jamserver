FROM alpine
RUN --mount=target=/mnt apk --allow-untrusted -X /mnt/repo/packages add ninjam-server
ENTRYPOINT ninjamsrv /etc/ninjam.cfg
