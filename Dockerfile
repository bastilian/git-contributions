FROM ruby:2.2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /contributions
WORKDIR /contributions
COPY Gemfile* /contributions/

RUN bundle install

EXPOSE 3000
