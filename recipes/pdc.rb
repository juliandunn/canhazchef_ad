#
# Cookbook Name:: havechef_ad
# Recipe:: pdc
#
# Copyright (C) 2014 Chef Software, Inc.
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Stuff that you need to have preinstalled before the LWRPs will
# work. In this order.
%w{ServerManager-Core-RSAT ServerManager-Core-RSAT-Role-Tools RSAT-AD-Tools-Feature ActiveDirectory-PowerShell}.each do |f|
  windows_feature f do
    action :install
  end
end

active_directory_domain node['canhazchef_ad']['domain'] do
  action :create
  type "forest"
  safe_mode_pass 'Passw0rd'
end
