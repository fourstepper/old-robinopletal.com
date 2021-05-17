FROM debian:buster

RUN apt-get -qq update \
	&& DEBIAN_FRONTEND=noninteractive apt-get -qq install -y --no-install-recommends curl \
	&& rm -rf /var/lib/apt/lists/*

# Configuration variables
ENV HUGO_VERSION 0.75.1
ENV HUGO_BINARY hugo_extended_${HUGO_VERSION}_Linux-64bit.deb
ENV SITE_DIR '/usr/share/blog'

# Download and install hugo
RUN curl -sL -o /tmp/hugo.deb \
    https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} && \
    dpkg -i /tmp/hugo.deb && \
    rm /tmp/hugo.deb && \
    mkdir ${SITE_DIR}

WORKDIR ${SITE_DIR}

COPY site/ ${SITE_DIR}

# Expose default hugo port
EXPOSE 1313

# Automatically build site
ONBUILD RUN hugo -d /usr/share/nginx/html/

# By default, serve site
ENV HUGO_BASE_URL https://robinopletal.com
CMD hugo server -b ${HUGO_BASE_URL} --appendPort=false --bind=0.0.0.0
