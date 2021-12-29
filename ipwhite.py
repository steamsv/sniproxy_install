import pymysql
import socket
import os

conn = pymysql.Connect(
    host='dns1.dnsunlock.com',
    port=3306,
    user='unlock',
    password='7bdc1d23dc99',
    db='steamsv_com',
    charset='utf8'
)
cursor = conn.cursor()
cursor.execute('select server from user')
res = cursor.fetchall()
cursor.close()
conn.close()

addset = set()
for re in res:
    try:
        addinfos = socket.getaddrinfo(re[0], None)
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