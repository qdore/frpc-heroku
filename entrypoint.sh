#!/bin/sh

cd /frpc

cat <<-EOF > /frpc/frpc.ini
[common]
token=${token}
server_addr = ${server}
server_port = ${port}

[http_hero]
type = tcp
remote_port = 6060
plugin = http_proxy

EOF

/frpc/frpc -c /frpc/frpc.ini
