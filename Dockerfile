FROM ruby:2.7-alpine

WORKDIR /app
COPY signals.rb /app
CMD "/app/signals.rb"
