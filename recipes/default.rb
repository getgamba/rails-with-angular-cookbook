#
# Cookbook Name:: rails
# Recipe:: default
#
# Copyright (C) 2014 Hirotaka Mizutani
# 
# All rights reserved - Do Not Redistribute
#

# Include recipes
include_recipe 'git'
include_recipe 'apt::default'
include_recipe 'ruby_build'
include_recipe 'imagemagick'
include_recipe 'mysql::server'
include_recipe 'zsh'
include_recipe 'redis::install'
include_recipe 'redis::server'
include_recipe 'rails::rbenv'
include_recipe 'rails::ubuntu_ja'

