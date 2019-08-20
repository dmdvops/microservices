FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y mongodb-server ruby-full ruby-dev build-essential git
RUN gem install bundler
RUN git clone https://github.com/Artemmkin/reddit.git

COPY mongod.conf /etc/mongod.conf
COPY db_config /reddit/db_config
COPY start.sh /start.sh

RUN gem install bcrypt -v '3.1.11' && gem install bson -v '4.2.2' && gem install bson_ext -v '1.5.1' && gem install puma -v '3.10.0' && cd /reddit && bundle install
RUN chmod 0777 /start.sh

CMD ["/start.sh"]