FROM ruby:2.7.1

WORKDIR /conversations

COPY . /conversations

RUN gem install bundler:2.1.4
RUN bundle install --without test deployment

CMD rackup -p 80 -o 0.0.0.0 --env production