
#!/bin/sh

/usr/sbin/named -c /etc/bind/named.conf
/bin/sh /etc/webmin/start
/usr/local/webadmin/webmin-init status

while /usr/local/webadmin/webmin-init status > /dev/null 2>&1; do
    sleep 1;
done

/etc/init.d/webmin status
