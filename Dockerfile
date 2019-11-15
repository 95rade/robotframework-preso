FROM alpine:latest

RUN apk update && apk upgrade \
  && echo @latest-stable http://nl.alpinelinux.org/alpine/latest-stable/community >> /etc/apk/repositories \
  && echo @latest-stable http://nl.alpinelinux.org/alpine/latest-stable/main >> /etc/apk/repositories \
  && apk add --no-cache \
    chromium@latest-stable \
    chromium-chromedriver@latest-stable \
    python3 \
  && pip3 install robotframework robotframework-seleniumlibrary robotframework-faker \
  && rm -rf /var/lib/apt/lists/* \
    /var/cache/apk/* \
    /usr/share/man \
    /tmp/*

# Add Chrome as a user
#RUN mkdir -p /robot \
#    && adduser -D chrome \
#    && chown -R chrome:chrome /robot
# Run Chrome as non-privileged
#USER chrome

# Add Jenkins as a user
RUN mkdir -p /robot \
    && adduser -D jenkins \
    && chown -R jenkins:jenkins /robot
# Run Chrome as non-privileged
USER jenkins
#WORKDIR /robot

ENV CHROME_BIN=/usr/bin/chromium-browser \
    CHROME_PATH=/usr/lib/chromium/
