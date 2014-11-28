FROM kamon/grafana_graphite

run     rm -rf /src/grafana/* && cd /src/grafana &&\
        wget http://grafanarel.s3.amazonaws.com/grafana-1.9.0-rc1.tar.gz &&\
		        tar xzvf grafana-1.9.0-rc1.tar.gz --strip-components=1 && rm grafana-1.9.0-rc1.tar.gz

ADD ./config.js /src/grafana/config.js
ADD ./local_settings.py /var/lib/graphite/webapp/graphite/local_settings.py

# ---------------- #
#   Expose Ports   #
# ---------------- #
# Grafana
EXPOSE  80

# StatsD UDP port
EXPOSE  8125/udp

# StatsD Management port
EXPOSE  8126

# -------- #
#   Run!   #
# -------- #
CMD     ["/usr/bin/supervisord"]
