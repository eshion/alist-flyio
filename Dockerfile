# FROM xhofe/alist:latest
# LABEL MAINTAINER="i@nn.ci"
# EXPOSE 5244
# RUN mkdir -p /opt/alist/data
# RUN chmod -R 777 /opt/alist/data
# ADD alist.sh /alist.sh
# RUN chmod +x /alist.sh

# CMD /alist.sh

FROM xhofe/alist:latest
LABEL MAINTAINER="i@nn.ci"
VOLUME /opt/alist/data/
WORKDIR /opt/alist/
RUN mkdir -p /opt/alist/data
RUN chmod -R 777 /opt/alist/data
COPY alist.sh /alist.sh
COPY install.sh /install.sh
RUN chmod +x /alist.sh /install.sh; \
  /install.sh

ENV PUID=0 PGID=0 UMASK=022
EXPOSE 5244 6800
ENTRYPOINT [ "/alist.sh" ]