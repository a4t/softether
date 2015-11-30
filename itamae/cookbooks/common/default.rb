execute "apt-get update" do
  command "apt-get update"
end

%w(wget make gcc git).each do |name|
  package name do
    action :install
  end
end

execute "add hosts" do
  command <<EOS
    sed -i '/127.0.1.1 ip/d' /etc/hosts
    echo 127.0.1.1 $(hostname) >> /etc/hosts
EOS
end