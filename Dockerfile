FROM xhofe/alist-aria2:latest
LABEL MAINTAINER="i@nn.ci"
EXPOSE 5244
RUN mkdir -p /opt/alist/data
RUN chmod -R 777 /opt/alist/data
ADD alist.sh /alist.sh
RUN chmod +x /alist.sh

CMD /alist.sh
