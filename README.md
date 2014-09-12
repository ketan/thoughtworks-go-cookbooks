# GoCD Cookbook

Cookbook to install ThoughtWorks Studio's [GoCD](https://go.cd).

## Supported and Tested Platforms

* CentOS/RHEL >= 6.4
* Ubuntu >= 12.04

## Attributes

This cookbook supports the following attributes:

### JDK Selection

* `node['gocd']['jdk_packages']` - override to use another jdk package. By default installs the OpenJDK 7 package from the default repositories.
* `node['gocd']['java_home']` - override to use another java home if you prefer to use a different JDK.

### Agent properties

* `node['gocd']['go-agent']['go_server_host']` - the hostname of the server hosting the go server. Defaults to `localhost`
* `node['gocd']['go-agent']['go_server_port']` - the port number of the server hosting the go server. Defaults to `8153`

### Agent autoregistration

* `node['gocd']['go-agent']['autoregister']['key']` - if the agent should use [auto register](http://www.go.cd/documentation/user/configuration/agent_auto_register.html) with the server, then enter the autoregistration key here. Default `nil`. Ensure that this is a really long and secure key.
* `node['gocd']['go-agent']['autoregister']['resources']` - the list of resources on this agent. Defaults to `['centos-<VERSION>']` or `['ubuntu-<VERSION>']` as appropriate.
* `node['gocd']['go-agent']['autoregister']['environments']` - the list of [go environments](http://www.go.cd/documentation/user/introduction/concepts_in_go.html#deployment-and-environments) that this agent is a part of

### Go server properties

* `node['gocd']['go-server']['autoregister']['key']` - if the server should support [auto registeration](http://www.go.cd/documentation/user/configuration/agent_auto_register.html), of agents, then enter the autoregistration key here. Default `nil`. Ensure that this is a really long and secure key.
* `node['gocd']['go-server']['http_port']` - the non-secure http port. Defaults to `8153`.
* `node['gocd']['go-server']['https_port']` = the secure http port. Defaults to `8154`.

* `node['gocd']['go-server']['min_mem']` - the minimum java heap memory(`-Xms`). Defaults to `512m`.
* `node['gocd']['go-server']['max_mem']` - the maximum java heap memory(`-Xmx`). Defaults to `1024m`.
* `node['gocd']['go-server']['min_perm_gen']` - the minimum java permgen memory(`-XX:PermSize`). Defaults to `128m`.
* `node['gocd']['go-server']['max_perm_gen']` - the maximum java permgen memory(`-XX:PermSize`). Defaults to `256m`.

## Usage

### gocd-cookbook::go-agent

Include `gocd-cookbook::go-agent` in your node's `run_list`, if you would like to install the go agent.

```json
{
  "run_list": [
    "recipe[gocd-cookbook::go-agent]"
  ]
}
```

### gocd-cookbook::go-server

Include `gocd-cookbook::go-server` in your node's `run_list`, if you would like to install the go server.

```json
{
  "run_list": [
    "recipe[gocd-cookbook::go-server]"
  ]
}
```

## License and Authors

Author:: Ketan Padegaonkar, ThoughtWorks, Inc. (ketan(at)thoughtworks.com)

```text
Copyright (C) 2014 ThoughtWorks, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
