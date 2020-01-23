FROM ruby:2.7-alpine

RUN addgroup -g 1000 -S appgroup && \
    adduser -u 1000 -S appuser -G appgroup

WORKDIR /app
COPY signals.rb /app

RUN chown -R appuser:appgroup /app

USER 1000

CMD "/app/signals.rb"
