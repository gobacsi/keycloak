FROM quay.io/keycloak/keycloak:latest as builder
WORKDIR /opt/keycloak
COPY ./providers/. ./providers
COPY ./themes/gobacsi ./themes
COPY ./themes/base/. ./themes/base

RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:latest
COPY --from=builder /opt/keycloak/ /opt/keycloak/

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]