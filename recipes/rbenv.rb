# -*- coding: utf-8 -*-
#
# Cookbook Name:: rails
# Recipe:: rbenv
#
# Copyright (C) 2013 Hirotaka Mizutani
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
rbenv_ruby "1.9.3-p484" do
  global true
end

rbenv_gem "bundler" do
  ruby_version "1.9.3-p484"
end
