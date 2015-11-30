require "digest/md5"

template node[:softether][:vpn_resource_path] do
  source 'templates/users.erb'
  owner 'root'
  group 'root'
  mode  '0744'
end

server_password = Digest::MD5.hexdigest(node[:softether][:master_password])[0, 20]
execute "Delete Softether source" do
  cwd "#{node[:softether][:dir]}/vpnserver"
  command "./vpncmd localhost:443 /SERVER /PASSWORD:#{server_password} /IN:#{node[:softether][:vpn_resource_path]}"
end