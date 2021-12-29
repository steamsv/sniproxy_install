import redis
import socket
import os

pool = redis.ConnectionPool(host='127.0.0.1', port=6379, decode_responses=True)
r = redis.Redis(host='127.0.0.1', port=6379, decode_responses=True)  

v = r.smembers('ip')

addset = set()
for re in v:
    try:
        addinfos = socket.getaddrinfo(re, None)
        for addinfo in addinfos:
            addset.add((addinfo[4][0], addinfo[0]))
            break
    except BaseException:
        pass

with open('/usr/local/openresty/nginx/conf/white-ipv4.conf', 'w') as ipv4, open('/usr/local/openresty/nginx/conf/white-ipv6.conf', 'w') as ipv6:
    for item in addset:
        if item[1] == socket.AddressFamily.AF_INET:
            ipv4.write("allow " + item[0] + ";\n")
        if item[1] == socket.AddressFamily.AF_INET6:
            ipv6.write("allow " + item[0] + ";\n")
            
os.system('systemctl reload openresty')