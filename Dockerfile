FROM ruby:3.4-slim

RUN apt-get update -qq && \
    apt-get install -y build-essential nodejs npm git vim && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY Gemfile* ./

RUN gem install bundler && bundle install

COPY . .

EXPOSE 4000

CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
