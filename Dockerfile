FROM ruby:alpine

RUN apk update
RUN apk add --no-cache --virtual build-deps \
        build-base \
        cmake \
        pkgconfig && \
    apk add --no-cache \
        openssl-dev \
        icu-dev \
        icu-libs \
        git && \
    gem install github-markdown && \
    gem install github-linguist && \
    gem install gollum && \
    apk del build-deps

WORKDIR /wiki
ENTRYPOINT ["gollum", "--port", "80"]
EXPOSE 80
