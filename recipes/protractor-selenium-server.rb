# -*- coding: utf-8 -*-
#
# Cookbook Name:: rails-with-angular
# Recipe:: protractor-selenium-server
#
# Copyright (C) 2014 Hirotaka Mizutani
# 
# All rights reserved - Do Not Redistribute
#

node.default['protractor-selenium-server']['selenium']['user'] = 'vagrant'
node.default['java']['jdk_version'] = '7'
node.default['java']['install_flavor'] = 'oracle'
node.default['java']['oracle']['accept_oracle_download_terms'] = true

include_recipe 'java'
include_recipe 'n-and-nodejs'
include_recipe 'protractor-selenium-server::default'
include_recipe 'protractor-selenium-server::services'

execute "start-selenium-standalone" do
  command "/etc/init.d/selenium-standalone start"
  action :run
end

execute "start-selenium-standalone" do
  command "/etc/init.d/selenium-standalone start"
  action :run
end

execute "npm install" do
  user "root"
  packages = ["generator-angular", "yo", "grunt-cli", "bower"]
  command "npm install -g #{packages.join(' ')}"
end
