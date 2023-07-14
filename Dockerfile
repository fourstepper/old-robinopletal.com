FROM docker.io/debian:bookworm as build

RUN apt-get -qq update \
	&& DEBIAN_FRONTEND=noninteractive apt-get -qq install -y --no-install-recommends ca-certificates curl \
	&& rm -rf /var/lib/apt/lists/*

# Configuration variables
ENV HUGO_VERSION 0.113.0
ENV HUGO_BINARY hugo_extended_${HUGO_VERSION}_linux-amd64.deb
ENV SITE_DIR '/usr/share/blog'

# Download and install hugo
RUN curl -sL -o hugo.deb \
    https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} &&\
    dpkg -i hugo.deb && rm hugo.deb && mkdir ${SITE_DIR}

WORKDIR /build
COPY site ${WORKDIR}

RUN hugo -d /src

FROM docker.io/nginx

RUN rm -rf /usr/share/nginx/html
COPY --from=build /src /usr/share/nginx/html

COPY nginx/default.conf /etc/nginx/conf.d
EXPOSE 1313
CMD ["nginx", "-g", "daemon off;"]
