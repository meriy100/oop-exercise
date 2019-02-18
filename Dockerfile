FROM ruby:2.6.0-alpine

COPY Gemfile* /oop/
WORKDIR /oop

RUN apk upgrade --no-cache && \
    apk add --update --no-cache \
      postgresql-client \
      nodejs \
      tzdata && \
    apk add --update --no-cache --virtual=build-dependencies \
      build-base \
      curl-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      mysql-client \
      mysql-dev \
      ruby-dev \
      yaml-dev \
      zlib-dev && \
    gem install bundler && \
    bundle install -j4 && \
    apk del build-dependencies

COPY . /oop

