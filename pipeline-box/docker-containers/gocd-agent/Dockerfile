FROM debian:wheezy
MAINTAINER Tim Klaesener <tklasene@thoughtworks.com>
MAINTAINER Tobias Vogel <tvogel@thoughtworks.com>
ENV DEBIAN_FRONTEND noninteractive
# Update and install minimal.
RUN \
	apt-get update \
	--quiet \
	&& apt-get install \
	--yes \
	--no-install-recommends \
	--no-install-suggests \
	# Packages to install
	procps \
	wget \
	openjdk-7-jdk \
	curl \
	zip \
	unzip \
	git \
    openssh-client \
	# Set timezone
	&& echo "Europe/Amsterdam" > /etc/timezone \
	&& dpkg-reconfigure -f noninteractive tzdata \
	# Clean up packages.
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* 
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
RUN groupadd go
RUN useradd go -g go
RUN \
	wget -O /tmp/go-agent.deb http://dl.bintray.com/gocd/gocd-deb/go-agent-15.1.0-1863.deb \
	&& dpkg -i /tmp/go-agent.deb \
	&& rm /tmp/go-agent.deb \
	&& sed -r -i "s/^(GO_SERVER)=(.*)/\1=\$SERVER_PORT_8153_TCP_ADDR/g" /etc/default/go-agent
ADD id_rsa /root/.ssh/id_rsa
VOLUME ["/var/lib/go-agent"]
CMD test -n "${GO_RESOURCES}" && echo "agent.auto.register.resources=${GO_RESOURCES}" >> config/autoregister.properties; \
    test -n "${GO_ENVIRONMENTS}" && echo "agent.auto.register.environments=${GO_ENVIRONMENTS}" >> config/autoregister.properties; \
    test -n "${GO_AUTO_REGISTER_KEY}" && echo "agent.auto.register.key=${GO_AUTO_REGISTER_KEY}" >> config/autoregister.properties; \
    /usr/lib/jvm/java-7-openjdk-amd64/bin/java -jar /usr/share/go-agent/agent-bootstrapper.jar $SERVER_PORT_8153_TCP_ADDR $SERVER_PORT_8153_TCP_PORT;
