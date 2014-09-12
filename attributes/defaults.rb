default['gocd']['jdk_packages'] = if platform_family?('rhel')
                                    %w(java-1.7.0-openjdk-devel)
                                  elsif platform_family?('debian')
                                    %w(openjdk-7-jdk)
                                  end

default['gocd']['java_home']    = if platform_family?('rhel')
                                    '/usr/lib/jvm/java-openjdk'
                                  elsif platform_family?('debian')
                                    '/usr/lib/jvm/java-7-openjdk-amd64'
                                  end

# where is the go server located?
default['gocd']['go-agent']['go_server_host'] = '10.0.2.15'
default['gocd']['go-agent']['go_server_port'] = 8153

# must set if autoregistration is required
default['gocd']['go-agent']['autoregister']['key'] = nil
default['gocd']['go-agent']['autoregister']['resources'] = [
  [node['platform'], node['platform_version'].split('.').first(2).join('.')].join('-')
]
default['gocd']['go-agent']['autoregister']['environments'] = []

# various properties for go server port and JVM options
default['gocd']['go-server']['autoregister']['key'] = nil
default['gocd']['go-server']['http_port'] = 8153
default['gocd']['go-server']['https_port'] = 8154

default['gocd']['go-server']['min_mem'] = '512m'
default['gocd']['go-server']['max_mem'] = '1024m'

default['gocd']['go-server']['min_perm_gen'] = '128m'
default['gocd']['go-server']['max_perm_gen'] = '256m'
