from alpine

copy dhcpd.conf /etc/dhcp/ 
copy entrypoint_run.sh /ep/

run apk update && apk add dhcp-server-vanilla tini jq tftp-hpa \
       && touch /var/lib/dhcp/dhcpd.leases && chmod 755 /ep/entrypoint_run.sh

ENTRYPOINT [ "/sbin/tini","--" ]

CMD /ep/entrypoint_run.sh

