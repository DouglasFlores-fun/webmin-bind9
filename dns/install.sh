#!/bin/sh
WEBMINDIR="/usr/local/webadmin"
BINDDIR="/etc/bind"
ZONESDIR="/var/lib/bind"
WORKDIR="/opt/webmin/dns"
mv $WORKDIR/named.conf.local $BINDDIR/
mv $WORKDIR/asw.sv.hosts $ZONESDIR/
mv $WORKDIR/udb.edu.sv.hosts $ZONESDIR/
service bind9 restart
