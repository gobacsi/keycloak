FROM quay.io/keycloak/keycloak:12.0.1
WORKDIR /opt/jboss/keycloak
COPY . .
