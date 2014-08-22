# -*- coding: utf-8 -*-
#
# Cookbook Name:: rails-with-angular
# Recipe:: rbenv
#
# Copyright (C) 2014 Hirotaka Mizutani
# 
# All rights reserved - Do Not Redistribute
#

# Dependant libraries for ruby
case node['platform']
when 'ubuntu', 'debian'
  # ruby dependences
  packages = [
    'build-essential',
    'binutils-doc',
    'build-essential',
    'bison',
    'libreadline6-dev',
    'curl',
    'zlib1g-dev',
    'libssl-dev',
    'libyaml-dev',
    'libsqlite3-dev',
    'sqlite3',
    'libxml2-dev',
    'libxslt1-dev',
    'autoconf',
    'libncurses5-dev',
    'libmysqlclient-dev',
    'libmagickwand-dev'
  ]
  packages.each do |pkg|
    package pkg do
      action :install
    end
  end
end

include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"
rbenv_ruby "2.1.2" do
  global true
end

rbenv_gem "bundler" do
  ruby_version "2.1.2"
end

rbenv_gem "compass" do
  ruby_version "2.1.2"
end
