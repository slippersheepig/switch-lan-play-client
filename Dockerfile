FROM alpine:3.20 AS builder

RUN apk add --no-cache \
    build-base \
    cmake \
    libpcap-dev \
    linux-headers \
    unzip \
    curl

WORKDIR /src
RUN curl -L -o /tmp/switch-lan-play-master.zip https://github.com/spacemeowx2/switch-lan-play/archive/refs/heads/master.zip \
 && unzip -q /tmp/switch-lan-play-master.zip -d /src \
 && mv /src/switch-lan-play-master /src/switch-lan-play

WORKDIR /build
RUN cmake -DCMAKE_BUILD_TYPE=Release /src/switch-lan-play \
 && make -j"$(nproc)" \
 && strip /build/lan-play

FROM alpine

RUN apk add --no-cache libpcap libstdc++

COPY --from=builder /build/lan-play /usr/local/bin/lan-play

ENTRYPOINT ["lan-play"]
