# -*- coding: utf-8 -*-
#
# Cookbook Name:: rails-with-angular
# Recipe:: postgresql
#
# Copyright (C) 2014 Hirotaka Mizutani
# 
# All rights reserved - Do Not Redistribute
#

node.default['postgresql']['password']['postgres'] = 'md53175bce1d3201d16594cebf9d7eb3f9d' # postgres

include_recipe 'postgresql::server'

