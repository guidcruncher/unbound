#!/bin/sh
curl -s https://www.internic.net/domain/named.root | tee /var/lib/unbound/root.hints
