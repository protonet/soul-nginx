FROM ruby:2.3

RUN gem install --no-rdoc --no-ri sinatra puma
COPY app.rb /root/
ENV PORT 5000
ENTRYPOINT ["ruby", "/root/app.rb"]