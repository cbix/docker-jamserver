FROM alpine
RUN --mount=source=repo,target=/repo apk --allow-untrusted -X /repo/packages add ninjam-server
ENTRYPOINT ninjamsrv /etc/ninjam.cfg
