FROM quay.io/keycloak/keycloak:latest
WORKDIR /opt/jboss/keycloak
COPY . .
RUN /opt/keycloak/bin/kc.sh build