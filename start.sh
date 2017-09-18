#!/bin/sh
[ -z "$UID" ] && UID=0
[ -z "$GID" ] && GID=0
echo -e "appuser:x:${UID}:${GID}:appuser:/app:/bin/false\n" >> /etc/passwd
echo -e "appgroup:x:${GID}:appuser\n" >> /etc/group
mkdir -p /config
mkdir -p /data
chown -R appuser:appgroup /config
chown appuser:appgroup /data
exec /bin/su -p -s "/bin/sh" -c "exec ./SABnzbd.py -b 0 -f /config/ -s 0.0.0.0:8080" appuser