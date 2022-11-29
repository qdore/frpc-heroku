#!/bin/sh

cd /frpc

cat <<-EOF > /frpc/frpc.ini
[common]
token=${token}
server_addr = ${server}
server_port = ${port}

[ssh]
type = tcp
local_ip = 127.0.0.1
local_port = 6000
remote_port = 16000

EOF

/frpc/frpc -c /frpc/frpc.ini &

/ss/shadowsocks2-linux -s 'ss://chacha20-ietf-poly1305:adore@:6000'
