if platform_family?('rhel')
  yum_repository 'thoughtworks-go' do
    description 'ThoughtWorks Studios GoCD YUM Repository'
    url         'http://dl.bintray.com/gocd/gocd-rpm'
    action      :add
    enabled     true
    gpgcheck    false
  end
elsif platform_family?('debian')
  apt_repository 'thoughtworks-gocd' do
    uri        'http://dl.bintray.com/gocd/gocd-deb'
    components ['/']
    action     :add
    trusted    true
  end
end
