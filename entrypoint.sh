#!/bin/sh

cd /frpc

cat <<-EOF > /frpc/frpc.ini
[common]
token=12345
server_addr = www.keithsu.ga
server_port = 7000

[http_hero]
type = tcp
remote_port = 6060
plugin = http_proxy

EOF

/frpc/frpc -c /frpc/frpc.ini &
