FROM ubuntu:18.04


WORKDIR /usr/local/webadmin

RUN apt update -y
RUN rm /etc/apt/apt.conf.d/docker-gzip-indexes && \
    apt-get purge apt-show-versions && \
    rm /var/lib/apt/lists/*lz4 && \
    apt-get -o Acquire::GzipIndexes=false update

RUN apt install git curl net-tools bind9 \ 
    perl libnet-ssleay-perl \ 
    openssl libauthen-pam-perl \
    libpam-runtime libio-pty-perl \
    apt-show-versions python -y

RUN git clone git://github.com/webmin/webmin.git . && \
    git clone https://github.com/authentic-theme/authentic-theme.git && \
    ln -s `which perl` /usr/local/bin/perl  && \
    ./local-setup.sh && \
    ./update-from-repo.sh -y

COPY . /opt/webmin/
RUN chmod +x /opt/webmin/webmin.sh && \
    chmod +x /opt/webmin/dns/install.sh && \
    /bin/sh /opt/webmin/dns/install.sh

EXPOSE 10000 53/tcp 53/udp
CMD /bin/sh /opt/webmin/webmin.sh
