FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql-client
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get install -y nodejs
RUN mkdir /camaleon-cms
WORKDIR /camaleon-cms
COPY Gemfile /camaleon-cms/Gemfile
COPY Gemfile.lock /camaleon-cms/Gemfile.lock
RUN bundle install
COPY . /camaleon-cms