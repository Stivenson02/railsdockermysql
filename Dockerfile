FROM ruby:3.1

RUN apt-get update -yqq

RUN apt-get install -yqq --no-install-recommends nodejs

COPY . /usr/src/app/

WORKDIR /usr/src/app

RUN bundle install

CMD ["rails", "s", "-b", "0.0.0.0"]