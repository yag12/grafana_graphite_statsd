FROM kamon/grafana_graphite

#run wget http://grafanarel.s3.amazonaws.com/grafana-1.9.0-rc1.tar.gz
run rm -rf /src/grafana/* && cd /src/grafana
ADD ./grafana-1.9.0-rc1/* /src/grafana/
#run cd /src/grafana && tar xzvf grafana-1.9.0-rc1.tar.gz --strip-components=1 && rm grafana-1.9.0-rc1.tar.gz

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
