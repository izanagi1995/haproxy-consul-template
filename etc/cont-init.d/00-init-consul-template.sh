#!/bin/sh

ln -s /var/run/s6/services/haproxy1 /haproxy-current
ln -s /var/run/s6/services/haproxy2 /haproxy-alt
if [ -z $CONSUL_ADDR ]; then
  consul-template -config /consul-template/config.d -consul-addr "$CONSUL_ADDR" -once
else
  consul-template -config /consul-template/config.d -once
fi
