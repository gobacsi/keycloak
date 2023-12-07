FROM quay.io/keycloak/keycloak:latest as builder
WORKDIR /opt/keycloak
COPY ./providers/. ./providers
COPY ./themes/gobacsi ./themes
COPY ./themes/base/login/. ./themes/base/login

RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:latest
COPY --from=builder /opt/keycloak/ /opt/keycloak/

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]