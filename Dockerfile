FROM alpine:latest
LABEL maintainer="SuperNG6"
RUN apk add --no-cache zerotier-one
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
