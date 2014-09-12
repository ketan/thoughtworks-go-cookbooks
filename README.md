# gocd

TODO: Enter the cookbook description here.

## Supported Platforms

* CentOS/RHEL >= 6.4
* Ubuntu >= 12.04

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['gocd-cookbook']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### gocd-cookbook::default

Include `gocd-cookbook` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[gocd-cookbook::default]"
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
