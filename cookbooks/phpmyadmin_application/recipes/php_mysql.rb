# Cookbook Name:: phpmyadmin_application
# Recipe:: php_mysql
#
# Copyright 2012, Chris Fordham
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

log "Setting up php/mysql"

case node['platform']
when "redhat","centos","scientific","fedora","suse","amazon"
  package "php-mysql"
when "debian","ubuntu"
  package "php5-mysql"
  package "libapache2-mod-auth-mysql"
end