FROM ruby:3.0.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql-client cmake npm

SHELL ["/bin/bash", "--login", "-c"]

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
RUN nvm install v16

RUN mkdir /var/site-colmeia

WORKDIR /var/site-colmeia

COPY Gemfile .

COPY Gemfile.lock .

RUN gem update --system && gem install bundler
RUN bundle install --jobs 4
RUN bundle exec rails db:setup

COPY . .

RUN curl -sL https://deb.nodesource.com/setup_12.x  | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y nodejs yarn

RUN bundle exec rails webpacker:install
RUN npm rebuild node-sass
RUN bundle exec rails assets:precompile

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
