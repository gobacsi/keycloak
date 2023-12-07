FROM quay.io/keycloak/keycloak:23.0.1 as builder
WORKDIR /opt/keycloak

COPY . .
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:23.0.1
COPY --from=builder /opt/keycloak/ /opt/keycloak/

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]