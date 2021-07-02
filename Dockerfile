FROM ruby:3.0.1

RUN curl -sL https://deb.nodesource.com/setup_12.x  | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client cmake yarn

RUN mkdir /var/app

WORKDIR /var/app

COPY Gemfile .

COPY Gemfile.lock .

RUN gem update --system && gem install bundler
RUN bundle install --jobs 4
RUN bundle exec rails db:setup RAILS_ENV=development RAILS_ENV=production rails webpacker:compile

COPY . .

RUN yarn add @rails/webpacker

CMD ["rails", "server", "-b", "0.0.0.0"]