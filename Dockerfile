FROM alpine

RUN apk add --update tzdata --no-cache --virtual .build-deps ca-certificates curl
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENV TZ=Asia/Shanghai
ENV FRP_VERSION 0.34.2

RUN wget https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && tar -xf frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && mkdir /frpc \
    && cp frp_${FRP_VERSION}_linux_amd64/frpc* /frpc/ \
    && rm -rf frp_${FRP_VERSION}_linux_amd64*

RUN wget https://github.com/shadowsocks/go-shadowsocks2/releases/download/v0.1.5/shadowsocks2-linux.tgz \
    && tar -zxf shadowsocks2-linux.tgz \
    && mkdir /ss \
    && cp shadowsocks2-linux /ss/ \
    && rm -rf shadowsocks2-linux.tgz

# Clean APK cache
RUN rm -rf /var/cache/apk/*

CMD /entrypoint.sh
