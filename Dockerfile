FROM alpine/helm:2.14.3
ARG AWS_REGION
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY

RUN helm init -c && \
    apk add --update --no-cache git bash && \
    helm plugin install https://github.com/hypnoglow/helm-s3.git && \
    rm -f /var/cache/apk/*
RUN helm repo add infobloxcto s3://infoblox-helm-dev/charts
