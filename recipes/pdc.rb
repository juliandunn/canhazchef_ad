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

include_recipe 'windows_ad::default'

windows_ad_domain node['canhazchef_ad']['domain'] do
  action :create
  type "forest"
  safe_mode_pass 'Passw0rd'
  domain_user 'chefad'
  domain_pass 'Passw0rd'
end

# Use IAM roles so we don't need to monkey with access keys
aws_elastic_ip 'pdc' do
  action :associate
  ip node['canhazchef_ad']['pdcip']
end
