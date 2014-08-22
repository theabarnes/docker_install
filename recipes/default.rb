#
# Cookbook Name:: docker_install
# Recipe:: default
#
# Copyright 2014, Alan Barnes
#
# All rights reserved - Do Not Redistribute
#

cookbook_file "/root/epel-release-6-8.noarch.rpm" do
  source "epel-release-6-8.noarch.rpm"
  owner "root"
  group "root"
  mode  "0644"
end

cookbook_file "/root/remi-release-6.rpm" do
  source "remi-release-6.rpm"
  owner "root"
  group "root"
  mode  "0644"
end

bash "Install rpm" do
  user "root"
  cwd  "/root"
  code <<-EOF
    /bin/rpm -Uvh remi-release-6.rpm
    /bin/rpm -Uvh epel-release-6-8.noarch.rpm
    EOF
end

package "docker-io" do
  action :install
end

package "docker-io" do
  action :upgrade
end

bash "Start Docker" do
  user "root"
  code <<-EOF
    /etc/init.d/docker start
    EOF
end
