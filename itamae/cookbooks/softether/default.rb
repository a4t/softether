node.reverse_merge!({
  'softether' => {
    'repo' => 'http://jp.softether-download.com/files/softether/v4.19-9599-beta-2015.10.19-tree/Linux/SoftEther_VPN_Server/64bit_-_Intel_x64_or_AMD64/softether-vpnserver-v4.19-9599-beta-2015.10.19-linux-x64-64bit.tar.gz',
  }
})

execute "Download Softether source" do
  cwd node[:softether][:dir]
  command <<EOS
    wget -O vpnserver.tar.gz #{node[:softether][:repo]} &&
    tar xzf vpnserver.tar.gz
EOS
  not_if "test -e ./vpnserver.tar.gz"
end

execute "Install Softether source" do
  cwd "#{node[:softether][:dir]}/vpnserver"
  command <<EOS
    make i_read_and_agree_the_license_agreement &&
    chmod 600 * && chmod 700 vpncmd vpnserver
EOS
end

execute "Delete Softether source" do
  cwd node[:softether][:dir]
  command "rm -rf vpnserver.tar.gz"
  only_if "test -e ./vpnserver.tar.gz"
end