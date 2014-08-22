#
# Cookbook Name:: rails-with-angular
# Recipe:: default
#
# Copyright (C) 2014 Hirotaka Mizutani
# 
# All rights reserved - Do Not Redistribute
#

# Include recipes
include_recipe 'git'
include_recipe 'apt::default'
include_recipe 'ubuntu-ja::default'
include_recipe 'ruby_build'
include_recipe 'imagemagick'
include_recipe 'mysql::server'
include_recipe 'rails-with-angular::postgresql'
include_recipe 'zsh'
include_recipe 'redis::install'
include_recipe 'redis::server'
include_recipe 'rails-with-angular::rbenv'
include_recipe 'build-essential'
include_recipe 'curl'
include_recipe 'rails-with-angular::protractor-selenium-server'

