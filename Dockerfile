FROM xhofe/alist:latest
LABEL MAINTAINER="i@nn.ci"
WORKDIR /opt/alist/

EXPOSE 5244
ADD config.json /opt/alist/data/config.json
CMD [ "./alist", "server", "--no-prefix" ]
