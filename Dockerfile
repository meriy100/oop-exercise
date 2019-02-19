FROM ruby:2.6.0-alpine

COPY Gemfile* /oop/
WORKDIR /oop

# RUN apk upgrade --no-cache && \
#     apk add --update --no-cache \
#       nodejs \
#       tzdata && \
#     apk add --update --no-cache --virtual=build-dependencies \
#       build-base \
#       curl-dev \
#       linux-headers \
#       libxml2-dev \
#       libxslt-dev \
#       mysql-client \
#       mysql-dev \
#       ruby-dev \
#       yaml-dev \
#       zlib-dev && \
RUN apk add --update bash ca-certificates git perl openssh nodejs
RUN apk add libxslt-dev libxml2-dev build-base
RUN apk add mysql-client mysql-dev
RUN gem install bundler
RUN bundle install -j4

COPY . /oop

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
