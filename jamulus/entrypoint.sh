#!/bin/sh
exec jamulus --multithreading \
  ${DIRECTORYADDRESS:+--directoryaddress "$DIRECTORYADDRESS"} \
  ${SERVERINFO:+--serverinfo "$SERVERINFO"} \
  ${WELCOMEMESSAGE:+--welcomemessage "$WELCOMEMESSAGE"} \
  ${NUMCHANNELS:+--numchannels "$NUMCHANNELS"} \
  "$@"
