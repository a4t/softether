server_password = Digest::MD5.hexdigest(node[:softether][:master_password])[0, 20]
psk = Digest::MD5.hexdigest(node[:softether][:psk])[0, 20]
p "\n\nShared Secret Key = #{psk}\n\n"

node[:softether][:hubs].each do |hubname, hubdata|
  hub_password = Digest::MD5.hexdigest(hubdata[:password])[0, 20]
  execute "Setting softether hub setting" do
    cwd "#{node[:softether][:dir]}/vpnserver"
    command <<EOS
      ./vpncmd localhost:443 /SERVER /PASSWORD:#{hub_password} /HUB:#{hubname} /cmd SecureNatEnable
      ./vpncmd localhost:443 /SERVER /PASSWORD:#{hub_password} /HUB:#{hubname} /cmd NatEnable
      ./vpncmd localhost:443 /SERVER /PASSWORD:#{hub_password} /HUB:#{hubname} /cmd DHCPEnable
EOS
  end
end

execute "Setting softether setting" do
  cwd "#{node[:softether][:dir]}/vpnserver"
  command "./vpncmd localhost:443 /SERVER /PASSWORD:#{server_password} /cmd IPsecEnable /L2TP:yes /L2TPRAW:no /ETHERIP:no /PSK:#{psk} /DEFAULTHUB:#{node[:softether][:default_hub]}"
end
