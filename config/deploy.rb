# -*- encoding : utf-8 -*-
require 'capistrano/ext/multistage'
require 'bundler/capistrano' #Using bundler with Capistrano
require 'cape'

set :stages, %w(staging production)
set :default_stage, "staging"


Cape do
  mirror_rake_tasks :dev
end