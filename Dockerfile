FROM debian:latest

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
			org.label-schema.name="Docker DocToc" \
			org.label-schema.description="Generates table of contents for markdown files inside local git repository." \
			org.label-schema.url="http://andradaprieto.es" \
			org.label-schema.vcs-ref=$VCS_REF \
			org.label-schema.vcs-url="https://github.com/jandradap/doctoc" \
			org.label-schema.vendor="Jorge Andrada Prieto" \
			org.label-schema.version=$VERSION \
			org.label-schema.schema-version="1.0" \
			maintainer="Jorge Andrada Prieto <jandradap@gmail.com>" \
			org.label-schema.docker.cmd="docker run --rm -it -v $(pwd):/usr/src jorgeandrada/doctoc --gitlab"



# WORKDIR /usr/src
#
# ENTRYPOINT ["doctoc", "--notitle"]
#
#
#
#
# cd ..
# mkdir WarBerry
# mv warberry/ WarBerry/
# cd WarBerry/
# mkdir Results
# mkdir tools

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir /root/tools && \
	sed -i 's/main/main contrib non-free/g' /etc/apt/sources.list && \
	apt-get update && apt-get install -y \
	wget \
	nbtscan \
	python-pip \
	python-scapy \
	tcpdump \
	nmap \
	python-nmap \
	python-bluez \
	smbclient \
	samba \
	samba-common-bin \
	unzip \
	python-dev \
	python3-dev \
	ppp \
	xprobe2 \
	sg3-utils \
	netdiscover \
	macchanger \
	libpcap-dev \
	onesixtyone \
	nikto \
	hydra \
	john \
	bridge-utils \
	w3af-console \
	ettercap-text-only \
	cryptcat \
	git \
	ike-scan \
	&& pip install optparse-pretty \
	netaddr \
	ipaddress \
	subprocess32 \
	pypcap




RUN	git clone https://github.com/DanMcInerney/net-creds.git /root/tools/net-creds && \
	git clone https://github.com/sqlmapproject/sqlmap.git /root/tools/sqlmap && \
	git clone https://github.com/CoreSecurity/impacket.git /root/tools/impacket && \
	git clone https://github.com/samratashok/nishang.git /root/tools/nishang && \
	git clone https://github.com/SpiderLabs/Responder.git /root/tools/Responder && \
	git clone https://github.com/PowerShellMafia/PowerSploit.git /root/tools/PowerSploit && \
	git clone https://github.com/offensive-security/exploit-database.git /root/tools/exploit-database




RUN wget http://seclists.org/nmap-dev/2016/q2/att-201/clamav-exec.nse -O /usr/share/nmap/scripts/clamav-exec.nse \
	&& wget https://labs.portcullis.co.uk/download/enum4linux-0.8.9.tar.gz -P /tmp/ \
	&& tar -zxvf /tmp/enum4linux-0.8.9.tar.gz -C /root/tools/  \
	&& mv /root/tools/enum4linux-0.8.9 /root/tools/enum4linux

# wget https://download.sysinternals.com/files/SysinternalsSuite.zip
# unzip SysinternalsSuite.zip -d sysinternals/
