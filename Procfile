web:        bundle exec rails s -p $PORT
worker:     TERM_CHILD=1 QUEUE=* bundle exec rake environment resque:work
scheduler:  bundle exec rake environment resque:scheduler