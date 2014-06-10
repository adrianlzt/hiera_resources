#!/bin/bash
#
# Use:
# ./generate_rpm VERSION
#
# Example:
# ./generate_rpm 0.1
#
fpm -s dir -t rpm --url https://github.com/adrianlzt/hiera_resources --prefix /usr/lib/ruby/site_ruby/1.8/puppet/parser/functions -n hiera_resources -v $1 -d puppet hiera_resources.rb
