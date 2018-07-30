FROM ruby:2.5.1-alpine3.7

ARG VERSION 

RUN apk add --update git bash openssh curl \
            make gcc libc-dev linux-headers

RUN mkdir -p /opt/cfn_nag

WORKDIR /opt/cfn_nag

# Building a released version from source
RUN git clone https://github.com/stelligent/cfn_nag.git ./ && \
    git checkout "v${VERSION}"

RUN gem install rake

# Same steps that the official cfn_nag CircleCI build takes
#     https://circleci.com/gh/stelligent/workflows/cfn_nag/tree/master
RUN bundle -v
RUN bundle check || bundle install
RUN bundle exec rubocop -D || echo Looks like you failed a lint
RUN bundle exec rspec --color --require spec_helper spec

RUN gem install cfn-nag

RUN mkdir -p /data
WORKDIR /data

CMD ["cfn_nag_scan"]
