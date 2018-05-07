node.reverse_merge!({
  'softether' => {
    'repo' => 'http://www.softether-download.com/files/softether/v4.27-9666-beta-2018.04.21-tree/Linux/SoftEther_VPN_Server/64bit_-_Intel_x64_or_AMD64/softether-vpnserver-v4.27-9666-beta-2018.04.21-linux-x64-64bit.tar.gz',
  }
})

execute "Download Softether source" do
  cwd node[:softether][:dir]
  command "wget -O vpnserver.tar.gz #{node[:softether][:repo]}"
  not_if "test -e ./vpnserver.tar.gz"
end

execute "Reset Softether" do
  cwd node[:softether][:dir]
  command "pkill -f vpnserver || echo 'no process'"
end

execute "Delete Softether" do
  cwd node[:softether][:dir]
  command "rm -rf #{node[:softether][:dir]}/vpnserver && sleep 10"
end

execute "Install Softether source" do
  cwd "#{node[:softether][:dir]}"
  command <<EOS
    tar xzf vpnserver.tar.gz
    cd vpnserver
    make i_read_and_agree_the_license_agreement
    chmod 600 * && chmod 700 vpncmd vpnserver
EOS
end

execute "Delete Softether source tar.gz" do
  cwd node[:softether][:dir]
  command "rm -rf vpnserver.tar.gz"
end

execute "Softether start" do
  cwd "#{node[:softether][:dir]}/vpnserver"
  command './vpnserver start && sleep 10' # 起動まで時間かかるので調整
end

master_password = Digest::MD5.hexdigest(node[:softether][:master_password])[0, 20]
execute "Set Softether master password" do
  cwd "#{node[:softether][:dir]}/vpnserver" # すぐに起動しないため
  command "./vpncmd localhost:443 /SERVER /cmd ServerPasswordSet #{master_password}"
end
