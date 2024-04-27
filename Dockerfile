FROM alpine
RUN apk add --no-cache build-base git cmake
RUN git clone https://github.com/spacemeowx2/switch-lan-play.git \
    && cd switch-lan-play \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make \
    && make install
RUN apk del build-base git cmake \
    && rm -rf /var/cache/apk/* /switch-lan-play
CMD ["lan-play"]
