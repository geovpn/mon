#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

BURIQ () {
    curl -sS  https://raw.githubusercontent.com/geovpn/perizinan/main/main/allow > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f  /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f  /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/geovpn/perizinan/main/main/allow | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/geovpn/perizinan/main/main/allow | awk '{print $4}' | grep $MYIP )
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
green "Permission Accepted !"
else
red "Permission Denied !"
rm setup.sh > /dev/null 2>&1
sleep 10
exit 0
fi
clear
domain=$(cat /etc/v2ray/domain)
tls=$(cat /etc/xray/vmesstls.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g')
none=$(cat /etc/xray/vmessnone.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g')
mkcp=$(cat /etc/xray/mkcp.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g')
uuid=$(cat /proc/sys/kernel/random/uuid)
user=dev-`</dev/urandom tr -dc X-Z0-9 | head -c4`
exp=1
read -p "SNI (bug): " sni 
read -p "Subdomain (EXP : geovpn.xyz. / Press Enter If Only Using Hosts) : " sub
dom=$sub$domain
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#tls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/vmesstls.json
sed -i '/#none$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/vmessnone.json
sed -i '/#mkcp$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/mkcp.json
cat > /etc/xray/$user-tls.json << EOF
      {
      "v": "0",
      "ps": "${user}",
      "add": "${dom}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "tcp",
      "path": "/xray",
      "type": "none",
      "host": "${sni}",
      "tls": "tls"
}
EOF
cat > /etc/xray/$user-none.json << EOF
      {
      "v": "0",
      "ps": "${user}",
      "add": "${dom}",
      "port": "${none}",
      "id": "${uuid}",
      "aid": "0",
      "net": "tcp",
      "path": "/xray",
      "type": "none",
      "host": "${sni}",
      "tls": "none"
}
EOF
cat > /etc/xray/$user-mkcp.json << EOF
      {
      "v": "0",
      "ps": "${user}",
      "add": "${dom}",
      "port": "${mkcp}",
      "id": "${uuid}",
      "aid": "0",
      "net": "kcp",
      "path": "/xray",
      "type": "dtls",
      "host": "${sni}",
      "tls": "none"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmesslink1="vmess://$(base64 -w 0 /etc/xray/$user-tls.json)"
vmesslink2="vmess://$(base64 -w 0 /etc/xray/$user-none.json)"
vmesslink3="vmess://$(base64 -w 0 /etc/xray/$user-mkcp.json)"
systemctl restart xr-vm-ntls.service
systemctl restart xr-vm-tls.service
systemctl restart xr-vm-mk.service
service cron restart
clear
echo -e "================================="
echo -e "            XRAY VMESS          " 
echo -e "================================="
echo -e "Remarks        : ${user}"
echo -e "Domain         : ${domain}"
echo -e "Subdomain      : ${dom}"
echo -e "port TCP       : ${tls}"
echo -e "port none TCP  : ${none}"
echo -e "port KCP       : ${mkcp}"
echo -e "id             : ${uuid}"
echo -e "alterId        : 0"
echo -e "Security       : auto"
echo -e "network        : TCP"
echo -e "path           : /xray"
echo -e "================================="
echo -e "Link TCP       : ${vmesslink1}"
echo -e "================================="
echo -e "Link None TCP  : ${vmesslink2}"
echo -e "================================="
echo -e "Link KCP       : ${vmesslink3}"
echo -e "================================="
echo -e "Expired On     : $exp"