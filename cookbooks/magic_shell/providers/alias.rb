action :add do
  command_name = new_resource.alias_name.gsub(/ /,"_")
  if !new_resource.command.nil?
    Chef::Log.info("Adding #{command_name}.sh to /etc/profile.d/")
    file_contents = "# This alias was generated by Chef for #{node["fqdn"]}\n"
    file_contents += "alias #{command_name}='#{new_resource.command}'"
    resource = file "/etc/profile.d/#{command_name}.sh" do
      owner "root"
      group "root"
      mode "0755"
      content file_contents
      action :nothing
    end
    resource.run_action(:create)
    new_resource.updated_by_last_action(true) if resource.updated_by_last_action?
  end
end

action :remove do
  command_name = new_resource.alias_name.gsub(/ /,"_")
  resource =  file "/etc/profile.d/#{command_name}.sh" do
    action :nothing
  end

  resource.run_action(:delete)
  new_resource.updated_by_last_action(true) if resource.updated_by_last_action?
end
