FROM ruby:3.0.1

RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y nodejs yarn postgresql-client cmake

RUN mkdir /app
WORKDIR /app

COPY . /app

RUN yarn install
RUN bundle install --jobs 4

CMD ["rails", "server", "-b", "0.0.0.0"]