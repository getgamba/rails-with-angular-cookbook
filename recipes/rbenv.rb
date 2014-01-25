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
    'libncurses5-dev'
  ]
  packages.each do |pkg|
    package pkg do
      action :install
    end
  end
end

rbenv = {}
rbenv['rubies'] = ['1.9.3-p484']
rbenv['global'] = '1.9.3-p484'
rbenv['gems']   = {
  '1.9.3-p484' => [
    { 'name' => 'bundler' }
  ]
}

include_recipe "rbenv::system_install"

Array(rbenv['rubies']).each do |rubie|
  if rubie.is_a?(Hash)
    rbenv_ruby rubie['name'] do
      environment rubie['environment'] if rubie['environment']
    end
  else
    rbenv_ruby rubie
  end
end

if rbenv['global']
  rbenv_global rbenv['global']
end

rbenv['gems'].each_pair do |rubie, gems|
  Array(gems).each do |gem|
    rbenv_gem gem['name'] do
      rbenv_version rubie

      %w{version action options source}.each do |attr|
        send(attr, gem[attr]) if gem[attr]
      end
    end
  end
end

# staff group member can install ruby via rbenv
directory "/usr/local/rbenv" do
  owner "root"
  group "staff"
  mode "2775"
  recursive true
end

Dir[ "/usr/local/rbenv/**/*" ].each do |path|
  if  File.directory?(path)
    directory path do
      owner "root"
      group "staff"
      mode "775"
    end
  end
end

# Add vagrant user to staff group
group "staff" do
  action :modify
  members "vagrant"
  append true
end
