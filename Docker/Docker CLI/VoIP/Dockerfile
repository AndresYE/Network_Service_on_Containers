FROM alpine:3.11

RUN apk update 
RUN apk upgrade
RUN apk add asterisk
		asterisk-sample-config \
RUN rm -fr /usr/lib/asterisk/modules/*pjsip* 
RUN asterisk -U asterisk


RUN rm -rf /var/run/asterisk/* \
RUN mkdir -p /var/spool/asterisk/fax \
RUN chown -R asterisk: /var/spool/asterisk/fax \
RUN truncate -s 0 /var/log/asterisk/messages \
                 /var/log/asterisk/queue_log \
RUN  rm -rf /var/cache/apk/* \
           /tmp/* \
           /var/tmp/*

EXPOSE 5060/udp 5060/tcp  10000-20000/udp
VOLUME /var/lib/asterisk/sounds /var/lib/asterisk/keys /var/lib/asterisk/phoneprov /var/spool/asterisk /var/log/asterisk

ADD docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]