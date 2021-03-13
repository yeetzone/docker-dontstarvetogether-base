FROM yeetzone/steamcmd
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
COPY /entrypoint.sh /
COPY /script/dontstarve_dedicated_server_nullrenderer /usr/local/bin

# Set permissions.
RUN set -ex \
	&& mkdir -p $STEAM_PATH \
	&& chown $STEAM_USER:$STEAM_USER $STEAM_PATH \
	&& chmod +x /entrypoint.sh \
	&& chmod +x /usr/local/bin/dontstarve_dedicated_server_nullrenderer \
	&& sync

# Set working directory.
WORKDIR "$STEAM_PATH/bin"

# Set entrypoint.
ENTRYPOINT ["/entrypoint.sh"]

# Set command.
CMD ["dontstarve_dedicated_server_nullrenderer"]
