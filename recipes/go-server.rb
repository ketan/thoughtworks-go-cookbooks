include_recipe 'gocd-cookbook::common'

ruby_block 'set environment variable to ensure that go server does not start on install' do
  block do
    ENV['DO_NOT_START_SERVICE'] = 'Y'
  end
end

package 'go-server'

ruby_block 'unset environment variable to ensure that go server does not start on install' do
  block do
    ENV.delete('DO_NOT_START_SERVICE')
  end
end

template '/etc/default/go-server' do
  source 'go-server.erb'
  mode '0644'
  owner 'root'
  group 'root'
  notifies :restart, 'service[go-server]'
end

service 'go-server' do
  action [:enable, :start]
  notifies :get, 'http_request[verify_go-server_comes_up]', :immediately
end

http_request 'verify_go-server_comes_up' do
  url 'http://localhost:8153/go/home'
  retry_delay 10
  retries 10
  action :nothing
end

ruby_block 'enable/disable agent autoregister on go server' do
  block do
    key = node['gocd']['go-server']['autoregister']['key']
    GoServerConfig.enable_autoregister(key)
  end
end
