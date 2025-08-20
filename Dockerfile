FROM alpine AS builder

RUN apk add --no-cache \
    build-base \
    cmake \
    libpcap-dev \
    linux-headers \
    git

WORKDIR /src
RUN git clone --recursive https://github.com/spacemeowx2/switch-lan-play.git

WORKDIR /build
RUN cmake -DCMAKE_BUILD_TYPE=Release /src/switch-lan-play \
 && make -j"$(nproc)" \
 && strip /build/src/lan-play

FROM alpine

RUN apk add --no-cache libpcap libstdc++

COPY --from=builder /build/src/lan-play /usr/local/bin/lan-play

ENTRYPOINT ["lan-play"]
