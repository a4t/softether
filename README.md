# softether

## Requirement
- Ruby ~> 2.3
- Bundler ~> 1.16.1

## Install

```
$ git clone https://github.com/a4t/softether.git
```

## Setting

```
$ bundle install
$ cp -rp itamae/nodes/sample.yaml itamae/nodes/localhost.yaml
$ vim itamae/nodes/localhost.yaml
```

## Use

```
$ bundle exec itamae local itamae/roles/softether.rb -y itamae/nodes/localhost.yaml
 INFO : Starting Itamae...
  1 modify
 INFO : Loading node data from /var/softether/itamae/nodes/localhost.yaml...


Shared Secret Key = xxxxxxxxxxxxxxxx


.
.
.
```

## User Password

```
$ cat /tmp/softether_users
```

## Mac client setting

![Mac client setting 1](https://user-images.githubusercontent.com/1901404/31275463-48342340-aad2-11e7-8660-f82eb397f93f.png)
![Mac client setting 2](https://user-images.githubusercontent.com/1901404/31275468-4b20e610-aad2-11e7-9061-87182e5b2a18.png)
![Mac client setting 3](https://user-images.githubusercontent.com/1901404/31275471-4e0af794-aad2-11e7-9425-2fd8de906822.png)
![Mac client setting 4](https://user-images.githubusercontent.com/1901404/31275506-6efbd036-aad2-11e7-8689-de29cd4f529b.png)

## Test

```
$ docker-compose build
$ docker-compose up -d
$ docker-compose exec ruby /bin/bash
root@45961bdxxxxx:/softether# bundle install
root@45961bdxxxxx:/softether# bundle exec itamae local itamae/roles/softether.rb -y itamae/nodes/sample.yaml
root@45961bdxxxxx:/softether# cat /tmp/softether_users
```
