
FROM ruby:2.6.3
RUN apt-get update -qq
RUN apt install nodejs npm -y
RUN npm install -g yarn

RUN mkdir /app

WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app

COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

EXPOSE 3000

ENTRYPOINT [ "./entrypoint.sh" ]