FROM alpine
RUN apk add --no-cache libpcap-dev git gcc g++ cmake
RUN git clone https://github.com/spacemeowx2/switch-lan-play.git \
    && cd switch-lan-play \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make \
    && make install
RUN apk del git gcc g++ cmake \
    && rm -rf /var/cache/apk/* /switch-lan-play
CMD ["lan-play"]
