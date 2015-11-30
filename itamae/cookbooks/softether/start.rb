psk = Digest::MD5.hexdigest(node[:softether][:psk])[0, 20]
execute "Setting softether start" do
  cwd "#{node[:softether][:dir]}/vpnserver"
  command <<EOS
    ./vpncmd localhost:443 /SERVER /PASSWORD:#{server_password} /cmd IPsecEnable /L2TP:yes /L2TPRAW:no /ETHERIP:no /PSK:#{psk} /DEFAULTHUB:node[:softether][:default_hub]
    ./vpncmd localhost:443 /SERVER /PASSWORD:#{server_password} /cmd SecureNatEnable
    ./vpncmd localhost:443 /SERVER /PASSWORD:#{server_password} /cmd NatEnable
    ./vpncmd localhost:443 /SERVER /PASSWORD:#{server_password} /cmd DHCPEnable
end