# frozen_string_literal: true

require 'bundler'
Bundler.require :test

Virtuatable::Application.load_tests!('conversations')
