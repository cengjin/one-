apk update
apk add py3-lxml
apk add python3
pip3 install pip==10.0.0
pip3 freeze
apk add --no-cache --virtual .build-deps tar
apk add --no-cache --virtual .build-deps wget
apk add --no-cache --virtual .build-deps openssl
apk add --no-cache --virtual .build-depslibsodium-dev
wget -O /tmp/shadowsocksr-3.2.2.tar.gz https://github.com/shadowsocksrr/shadowsocksr/archive/3.2.2.tar.gz
tar zxf /tmp/shadowsocksr-3.2.2.tar.gz -C /tmp
mv /tmp/shadowsocksr-3.2.2/shadowsocks /usr/local/
rm -fr /tmp/shadowsocksr-3.2.2
rm -f /tmp/shadowsocksr-3.2.2.tar.gz
cd /root
echo '{
    "server":"0.0.0.0",
    "server_ipv6":"::",
    "server_port":80,
    "local_address":"127.0.0.1",
    "local_port":1080,
    "password":"123",
    "timeout":120,
    "method":"chacha20",
    "protocol":"origin",
    "protocol_param":"",
    "obfs":"http_simple",
    "obfs_param":"",
    "redirect":"",
    "dns_ipv6":false,
    "fast_open":true,
    "workers":1
}' >1.json
nohup python3 /usr/local/shadowsocks/server.py -c /root/1.json &
echo "nohup python3 /usr/local/shadowsocks/server.py -c /root/1.json & " >/etc/local.d/ss.start
chmod +x /etc/local.d/ss.start
rc-update add local


