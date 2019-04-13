FROM ruby:2.4
RUN apt-get update -qq && apt-get install -y nodejs git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev libffi-dev nano nginx apache2
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN gem install bundler && bundle install --jobs 20 --retry 5
COPY . /myapp
