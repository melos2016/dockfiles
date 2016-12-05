FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN echo "deb http://mirrors.163.com/ubuntu xenial main universe" > /etc/apt/sources.list \
    && apt update \
    && apt install -y openssh-server wget python-software-properties \
    && mkdir /var/run/sshd \
    && echo "root:123456" | chpasswd \
    && sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config \
    && rm -rf /tmp/* /var/tmp/* /var/cache/apt/archives/* /var/lib/apt/lists/* \
    && mkdir -p /root/Dropbox 

ADD b /root

RUN cd ~ && wget -O - "http://192.168.91.1/1.tar.gz" | tar xzf - \
    && wget -O - "http://192.168.91.1/2.tar.gz" | tar xzf - \    
    && wget -O dropbox.py "http://192.168.91.1/1.py" \
    && chmod +x dropbox.py \
    && chmod +x a.sh

EXPOSE 22 80 443

CMD /root/a.sh





