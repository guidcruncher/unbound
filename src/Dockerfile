# Use Alpine Linux as the base image
FROM alpine:latest

# Install unbound and remove the cache to keep the image small
RUN apk update && \
    apk add --no-cache tini curl unbound gettext openssl && \
    rm -rf /var/cache/apk/*

COPY ./updatehints.sh /usr/local/bin/updatehints.sh
COPY ./entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/*.sh

COPY ./config/root.hints /var/lib/unbound/root.hints

COPY ./config/pi-hole.conf /etc/unbound/unbound.conf.d/pi-hole.conf
COPY ./config/remote-control.conf /etc/unbound/unbound.conf.d/remote-control.conf

COPY ./config/usersettings.template /etc/unbound/usersettings.template

# Expose the standard DNS ports (UDP/TCP)
EXPOSE 5335/udp 5335/tcp

# Run unbound in the foreground so the container stays active
# -d prevents it from daemonizing (forking to background)
# -c points to the configuration file
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/usr/local/bin/entrypoint.sh"]
