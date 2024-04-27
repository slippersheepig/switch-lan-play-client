FROM alpine

ENV LANVERSION=0.2.3

RUN apk add --no-cache ca-certificates libpcap-dev wget
WORKDIR /usr/bin
RUN wget -O /usr/bin/lan-play-linux https://github.com/spacemeowx2/switch-lan-play/releases/download/v$LANVERSION/lan-play-linux
RUN chmod +x /usr/bin/lan-play-linux
RUN apk del wget
ENV RELAY_SERVER_ADDR=""
CMD ["/usr/bin/lan-play-linux", "--relay-server-addr", "$RELAY_SERVER_ADDR"]
