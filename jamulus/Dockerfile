FROM alpine
RUN --mount=source=repo,target=/repo apk --allow-untrusted -X /repo/packages add jamulus-headless
ENTRYPOINT jamulus --nogui --server --multithreading \
  ${DIRECTORYADDRESS:+--directoryaddress "$DIRECTORYADDRESS"} \
  ${SERVERINFO:+--serverinfo "$SERVERINFO"} \
  ${WELCOMEMESSAGE:+--welcomemessage "$WELCOMEMESSAGE"} \
  ${NUMCHANNELS:+--numchannels "$NUMCHANNELS"}
