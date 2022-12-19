FROM xhofe/alist:v2.6.4
LABEL MAINTAINER="i@nn.ci"

RUN chmod -R 777 /opt/alist/data
ADD alist.sh /alist.sh
RUN chmod +x /alist.sh

CMD /alist.sh
