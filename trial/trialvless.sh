#!/bin/bash
# Vless
# =======================

# Color
RED="\e[1;31m"
GREEN="\e[0;32m"
NC="\e[0m"

ipadd=$(curl -s ipinfo.io/ip);

# Validate Your IP Address
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$(curl -sS https://raw.githubusercontent.com/castleUI/ipvps/main/ip | awk '{print $4}' | grep $MYIP )
if [[ $MYIP = $IZIN ]]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Please Contact Admin!!"
rm -f setup.sh
exit 0
fi
rm -f setup.sh
clear
IP=$( curl -s ipinfo.io/ip );
clear
source /var/lib/kdevn9/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$(cat /etc/v2ray/domain)
fi
tls=$( cat /etc/v2ray/vless.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g' );
none=$( cat /etc/v2ray/vnone.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g');
user=dev-`</dev/urandom tr -dc X-Z0-9 | head -c4`
exp=1
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
read -p "SNI (bug) : " sni
read -p "Subdomain (EXP : kdevn9.xyz. / Press Enter If Only Using Hosts) : " sub
dom=$sub$domain
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/v2ray/vless.json
sed -i '/#none$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/v2ray/vnone.json
vlesslink1="vless://${uuid}@${dom}:$tls?path=/v2ray&security=tls&encryption=none&type=ws&sni=$sni#${user}"
vlesslink2="vless://${uuid}@${dom}:$none?path=/v2ray&encryption=none&type=ws&sni=$sni#${user}"
systemctl restart v2ray@vless
systemctl restart v2ray@vnone
clear
echo -e "================================="
echo -e "            V2RAY VLESS          "
echo -e "================================="
echo -e "Remarks        : ${user}"
echo -e "Domain         : ${dom}"
echo -e "port TCP       : $tls"
echo -e "port none TCP  : $none"
echo -e "id             : ${uuid}"
echo -e "Encryption     : none"
echo -e "network        : tcp"
echo -e "path           : /xray"
echo -e "================================="
echo -e "link TLS       : ${vlesslink2}"
echo -e "================================="
echo -e "link TCP       : ${vlesslink1}"
echo -e "================================="
echo -e "Expired On     : $exp"
