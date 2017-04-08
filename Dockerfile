FROM alpine:3.4
MAINTAINER APinnamaneni
ADD /apk /apk
RUN cp /apk/.abuild/-58b7ee0c.rsa.pub /etc/apk/keys
RUN apk --update add /apk/ossp-uuid-1.6.2-r0.apk
RUN apk add /apk/ossp-uuid-dev-1.6.2-r0.apk
RUN apk add /apk/x11vnc-0.9.13-r0.apk
RUN apk add --no-cache \
    gcc \
    linux-headers \
    musl-dev \
    python3 \
    python3-dev \
    gcc libffi-dev musl-dev openssl-dev \
    alpine-desktop xfce4 xfce4-terminal xvfb openbox supervisor sudo \
    bash

RUN pip3 install --upgrade pip setuptools

RUN pip3 install cssselect futures keyring beautifulsoup4 selenium requests asyncio \
&& apk del build-base python3-dev libffi-dev musl-dev openssl-dev \
&& rm -rf /apk /tmp/* /var/cache/apk/* \
&& addgroup alpine \
&& adduser  -G alpine -s /bin/sh -D alpine \
&& echo "alpine:alpine" | /usr/sbin/chpasswd \
&& echo "alpine  ALL=(ALL) ALL" >> /etc/sudoers 
ADD etc /etc
ADD scripts /home/alpine/scripts
WORKDIR /home/alpine
EXPOSE 5900
USER alpine
# Add to home dir
RUN echo "alpine" | sudo -S cp /etc/geckodriver /usr/local/bin/ 
RUN echo "alpine" | sudo -S chown alpine:alpine /home/alpine/*
#CMD ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]
CMD ["/home/alpine/scripts/startup.sh"]
