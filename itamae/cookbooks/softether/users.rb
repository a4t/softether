template '/tmp/softether_users' do
  source 'templates/users.erb'
  owner 'root'
  group 'root'
  mode  '0744'
end