#!/bin/bash

cd Rails
yarn install
rails db:migrate
rm -f tmp/pids/server.pid
rails s -b 0.0.0.0
