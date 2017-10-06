# softether

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
