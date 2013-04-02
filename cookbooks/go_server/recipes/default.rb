yum_repository "thoughtworks-go" do
  description "ThoughtWorks Go Repository"
  url         "http://download01.thoughtworks.com/go/yum/no-arch"
  action      :add
  enabled     1
end

package "java-1.7.0-openjdk-devel"

template "/etc/default/go-server" do
  source "go-server.erb"
  mode "0644"
  owner "root"
  group "root"
  notifies :restart, "service[go-server]"
end

package "go-server" do
  action [:install, :upgrade]
end

service "go-server" do
  supports :status => true, :restart => true, :start => true, :stop => true
  action [:enable, :start]
end
