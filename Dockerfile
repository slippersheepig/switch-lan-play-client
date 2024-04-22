FROM alpine

ENV LANVERSION=0.2.3

RUN apk add --no-cache ca-certificates libpcap-dev wget
WORKDIR /app
RUN wget -O lan-play-linux https://github.com/spacemeowx2/switch-lan-play/releases/download/v$LANVERSION/lan-play-linux
RUN chmod +x lan-play-linux
ENTRYPOINT ["/app/lan-play-linux"]
