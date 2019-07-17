FROM iskaron/ts3:3.9.1
MAINTAINER Iskaron <mail@iskaron.de>

VOLUME [ "/config", "/opt/ts3/logs", "/opt/ts3/files" ]

WORKDIR /opt/ts3

EXPOSE 10011
EXPOSE 30033
EXPOSE 4711/udp
EXPOSE 9987-9999/udp

ENV LD_LIBRARY_PATH .:./redist:$LD_LIBRARY_PATH
ENV TS_DIR=/opt/ts3

RUN chown teamspeak $TS_DIR

USER teamspeak

RUN ln -sf /config/licensekey.dat $TS_DIR/licensekey.dat
RUN ln -sf /config/serverkey.dat $TS_DIR/serverkey.dat
RUN ln -sf /config/query_ip_whitelist.txt $TS_DIR/query_ip_whitelist.txt
RUN ln -sf /config/query_ip_blacklist.txt $TS_DIR/query_ip_blacklist.txt
RUN ln -sf /config/ts3server.sqlitedb $TS_DIR/ts3server.sqlitedb
RUN ln -sf /config/.ts3server_license_accepted $TS_DIR/.ts3server_license_accepted

CMD [ "./ts3server", "inifile=/config/ts3server.ini" ]

