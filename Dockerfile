FROM gui-apps-base:18.04
MAINTAINER Gabriel Ionescu <gabriel.ionescu@gameloft.com>

ARG APP_VERSION

RUN echo "\n > UPDATE REPOS\n" \
 && apt-get update \
 \
 && echo "\n > INSTALL DEPENDENCIES\n" \
 && apt-get install -y --no-install-recommends \
        gconf2 \
        gconf-service \
        libnotify4 \
        libappindicator1 \
        libxtst6 \
        libnss3 \
        libxss1 \
        libasound2 \
        libx11-xcb1 \
        libxcb1 \
        libgtk-3-0 \
        wget \
 \
 && echo "\n > DOWNLOAD PACKAGE\n" \
 && wget --no-check-certificate "https://releases.mattermost.com/desktop/$APP_VERSION/mattermost-desktop-$APP_VERSION-linux-amd64.deb" -O /tmp/mattermost.deb \
 \
 && echo "\n > INSTALL\n" \
 && dpkg -i /tmp/mattermost.deb \
 \
 && echo "\n > CLEANUP\n" \
 && rm -f /tmp/* \
 && apt-get remove -y wget \
 && apt-get clean -y \
 && apt-get autoclean -y \
 && apt-get autoremove -y

# SET USER
USER $DOCKER_USERNAME

# ENTRYPOINT
ENTRYPOINT /usr/local/bin/mattermost-desktop

