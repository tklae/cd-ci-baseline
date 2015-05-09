FROM debian:wheezy
MAINTAINER Tim Klaesener <tklasene@thoughtworks.com>
ENV DEBIAN_FRONTEND noninteractive
# Update and install minimal.
RUN \
	apt-get update --quiet \
	&& apt-get install --yes --no-install-recommends --no-install-suggests procps wget openjdk-7-jre-headless curl unzip git \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& echo "Europe/Amsterdam" > /etc/timezone \
	&& dpkg-reconfigure -f noninteractive tzdata
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
RUN groupadd go
RUN useradd go -g go
RUN \
	wget -O /tmp/go-server.deb http://dl.bintray.com/gocd/gocd-deb/go-server-15.1.0-1863.deb \
	&& dpkg -i /tmp/go-server.deb \
	&& rm /tmp/go-server.deb
EXPOSE 8153
EXPOSE 8154
CMD ["/etc/init.d/go-server", "start"]
CMD /etc/init.d/go-server start && tail -f /var/log/go-server/go-server.log
