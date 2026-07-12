#!/bin/sh
curl -s https://www.internic.net/domain/named.root > /var/lib/unbound/root.hints
curl -s https://data.iana.org/root-anchors/icannbundle.pem >  /etc/unbound/icannbundle.pem

if [ ! -f /etc/unbound/unbound_control.pem ] || \
   [ ! -f /etc/unbound/unbound_server.pem ] || \
   [ ! -f /etc/unbound/unbound_control.key ] || \
   [ ! -f /etc/unbound/unbound_server.key ]; then
    /usr/sbin/unbound-control-setup
fi

envsubst < /etc/unbound/usersettings.template > /etc/unbound/unbound.conf.d/usersettings.conf

/usr/sbin/unbound -d -c /etc/unbound/unbound.conf
