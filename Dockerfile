FROM xhofe/alist:latest
LABEL MAINTAINER="i@nn.ci"
EXPOSE 5244
RUN chmod -R 777 /opt/alist/data
ADD alist.sh /alist.sh
RUN chmod +x /alist.sh

CMD /alist.sh
