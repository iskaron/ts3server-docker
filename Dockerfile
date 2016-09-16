FROM iskaron/ts3:3.0.13.4
MAINTAINER Iskaron <mail@iskaron.de>

VOLUME [ "/config", "/opt/ts3/logs", "/opt/ts3/files" ]

USER teamspeak
WORKDIR /opt/ts3

EXPOSE 10011
EXPOSE 30033
EXPOSE 4711/udp
EXPOSE 9987-9999/udp

ENV LD_LIBRARY_PATH .:./redist:$LD_LIBRARY_PATH
ENV TS_DIR=/opt/ts3

RUN ln -sf /config/licensekey.dat $TS_DIR/licensekey.dat
RUN ln -sf /config/serverkey.dat $TS_DIR/serverkey.dat
RUN ln -sf /config/query_ip_whitelist.txt $TS_DIR/query_ip_whitelist.txt
RUN ln -sf /config/query_ip_blacklist.txt $TS_DIR/query_ip_blacklist.txt
RUN ln -sf /config/ts3server.sqlitedb $TS_DIR/ts3server.sqlitedb

CMD [ "./ts3server", "inifile=/config/ts3server.ini" ]

