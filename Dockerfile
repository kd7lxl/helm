FROM alpine/helm:2.14.3
ARG AWS_REGION
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY

RUN helm init -c && \
    apk add --update --no-cache git bash && \
    AWS_REGION=$AWS_REGION AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY helm plugin install https://github.com/hypnoglow/helm-s3.git && \
    rm -f /var/cache/apk/*