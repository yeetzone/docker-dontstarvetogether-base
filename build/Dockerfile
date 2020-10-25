# Create final image.
FROM yeetzone/steamcmd:next
MAINTAINER YEET Zone <support@yeet.zone>

# Set environment.
ARG STEAM_PATH="/data"
ENV STEAM_PATH ${STEAM_PATH}

# Install dependencies.
RUN set -ex \
	&& dpkg --add-architecture i386 \
	&& apt-get update \
	&& apt-get install --yes --no-install-recommends \
		lib32stdc++6 \
		libcurl4-gnutls-dev:i386 \
	&& apt-get clean \
	&& rm -rf \
	    /tmp/* \
	    /var/tmp/* \
	    /var/lib/apt/lists/*

# Copy scripts.
COPY /script/dontstarvetogether /usr/local/bin
RUN set -ex \
	&& chmod +x /usr/local/bin/dontstarvetogether

# Copy entrypoint script.
COPY /entrypoint.sh /

# Set working directory.
WORKDIR "$STEAM_PATH/bin"

# Set entrypoint.
ENTRYPOINT ["/entrypoint.sh"]

# Set command.
CMD ["dontstarvetogether"]
