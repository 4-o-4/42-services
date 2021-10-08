FROM alpine:3.12

RUN apk update && \
    apk --update --no-cache add \
    ca-certificates \
    wget

RUN wget --quiet https://dl.grafana.com/oss/release/grafana-7.5.5.linux-amd64.tar.gz && \
    tar -xzvf grafana-7.5.5.linux-amd64.tar.gz > /dev/null && \
    rm -rf grafana-7.5.5.linux-amd64.tar.gz && \
    mv grafana-7.5.5 /grafana && \
    \
    wget --quiet --output-document /etc/apk/keys/sgerrand.rsa.pub \
    https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget --quiet https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.33-r0/glibc-2.33-r0.apk && \
    apk add glibc-2.33-r0.apk

COPY conf/grafana.db /grafana/data/

WORKDIR /grafana/bin/

EXPOSE 3000

CMD ["./grafana-server"]
