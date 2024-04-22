FROM ubuntu

ENV LANVERSION=0.2.3

RUN apt update && apt install libpcap-dev wget -y
WORKDIR /usr/bin
RUN wget -O /usr/bin/lan-play-linux https://github.com/spacemeowx2/switch-lan-play/releases/download/v$LANVERSION/lan-play-linux && chmod +x /usr/bin/lan-play-linux

ENTRYPOINT ["lan-play-linux"]
