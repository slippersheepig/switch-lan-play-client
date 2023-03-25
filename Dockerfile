FROM alpine

ENV LANVERSION=0.2.3

RUN apk add libpcap-dev wget gcompat
WORKDIR /usr/bin
RUN wget -O /usr/bin/lan-play-linux https://github.com/spacemeowx2/switch-lan-play/releases/download/v$LANVERSION/lan-play-linux && chmod +x /usr/bin/lan-play-linux

ENTRYPOINT ["lan-play-linux"]
