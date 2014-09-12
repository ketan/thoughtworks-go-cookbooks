class Chef::Recipe::GoServerConfig
  SERVER_LINE_REGEX = /\s+<server .*/
  def self.enable_autoregister(autoregister_key)
    server_line = ::File.readlines('/etc/go/cruise-config.xml').grep(SERVER_LINE_REGEX).first.to_s.strip
    file = Chef::Util::FileEdit.new('/etc/go/cruise-config.xml')
    existing_key_in_config_xml  = $1 if server_line =~ /agentAutoRegisterKey="(\S+)"/

    if autoregister_key && !existing_key_in_config_xml
      server_line.sub!(' ', %Q{ agentAutoRegisterKey="#{autoregister_key}" })
      file.search_file_replace(SERVER_LINE_REGEX, server_line)
    end

    if existing_key_in_config_xml && !autoregister_key
      server_line.sub!(/agentAutoRegisterKey="(\S+)"/, '')
      file.search_file_replace(SERVER_LINE_REGEX, server_line)
    end

    if autoregister_key && existing_key_in_config_xml && autoregister_key != existing_key_in_config_xml
      server_line.sub!(/agentAutoRegisterKey="(\S+)"/, %Q{agentAutoRegisterKey="#{autoregister_key}"})
      file.search_file_replace(SERVER_LINE_REGEX, server_line)
    end

    file.write_file
  end
end
