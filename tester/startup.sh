#!/bin/bash

cd Rails
rails db:migrate
rm -f tmp/pids/server.pid
rails s -b 0.0.0.0
