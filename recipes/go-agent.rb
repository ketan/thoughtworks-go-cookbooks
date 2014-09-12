include_recipe 'gocd-cookbook::common'

package 'go-agent'

template '/etc/default/go-agent' do
  source 'go-agent.erb'
  mode '0644'
  owner 'root'
  group 'root'
  notifies :restart, 'service[go-agent]'
end

directory '/var/lib/go-agent/config' do
  owner 'go'
  group 'go'
  mode  '0750'
  recursive true
end

if node['gocd']['go-agent']['autoregister']['key']
  template '/var/lib/go-agent/config/autoregister.properties' do
    owner 'go'
    group 'go'
    mode '0600'
    source 'autoregister.properties.erb'
    notifies :restart, 'service[go-agent]'
  end
else
  file '/var/lib/go-agent/config/autoregister.properties' do
    action :delete
  end
end

service 'go-agent' do
  action [:enable, :start]
end
