FROM alpine:3.11

ENV SONAR_SCANNER_ASC_URL https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.2.0.1873.zip.asc
ENV SONAR_SCANNER_URL https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.2.0.1873.zip
ENV SONAR_SCANNER_VERSION 4.2.0.1873

# SonarSource Deployer
ENV GPG_KEY=F1182E81C792928921DBCAB4CFCA4A29D26468DE

RUN set -eux; \
    \
    apk add --no-cache --virtual .fetch-deps gnupg; \
    \
    wget -qO /opt/sonar-scanner.zip.asc "${SONAR_SCANNER_ASC_URL}"; \
    wget -qO /opt/sonar-scanner.zip "${SONAR_SCANNER_URL}"; \
    \
    export GNUPGHOME="$(mktemp -d)"; \
    gpg --batch --keyserver ha.pool.sks-keyservers.net --recv-keys "${GPG_KEY}" \
      || gpg --batch --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "${GPG_KEY}" \
    ; \
    gpg --batch --verify \
      /opt/sonar-scanner.zip.asc \
      /opt/sonar-scanner.zip \
    ; \
    gpgconf --kill all; \
    rm -f /opt/sonar-scanner.zip.asc; \
    rm -Rf "${GNUPGHOME}"; \
    \
    apk del --no-network .fetch-deps; \
    \
    apk add --no-cache openjdk11-jre-headless; \
    \
    unzip -q /opt/sonar-scanner.zip -d /opt/; \
    ln -s /opt/sonar-scanner-"${SONAR_SCANNER_VERSION}"/bin/sonar-scanner /usr/local/bin/; \
    rm /opt/sonar-scanner.zip; \
    \
# Smoke test
    sonar-scanner --version

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["sonar-scanner"]
