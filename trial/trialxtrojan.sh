#!/bin/bash
# My Telegram : https://t.me/kdevn9
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

BURIQ () {
    curl -sS  https://raw.githubusercontent.com/castleUI/ipvps/main/ipvps > /root/tmp
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
Name=$(curl -sS https://raw.githubusercontent.com/castleUI/ipvps/main/ipvps | grep $MYIP | awk '{print $2}')
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
    IZIN=$(curl -sS https://raw.githubusercontent.com/castleUI/ipvps/main/ipvps | awk '{print $4}' | grep $MYIP )
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
source /var/lib/kdevn9/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
tr="$(cat /etc/xray/trojan.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/       //g')"
user=dev-`</dev/urandom tr -dc X-Z0-9 | head -c4`
exp=1
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "SNI (bug) : " sni
read -p "Subdomain (EXP : kdevn9.xyz. / Press Enter If Only Using Hosts) : " sub
dom=$sub$domain
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xray-trojan$/a\#&# '"$user na$exp"'\
},{"password": "'""$userna""'","email": "'""$userna""'"' /etc/xray/trojan.json
systemctl restart x-tr.service
trojanlink="trojan://${user}@${dom}:${tr}?sni=$sni#$user"
service cron restart
clear

echo -e "======-Xray/TROJAN-======"
echo -e "Remarks   : ${user}"
echo -e "IP/Host   : ${MYIP}"
echo -e "Domain    : ${domain}"
echo -e "Subdomain : $dom"
echo -e "Port      : ${tr}"
echo -e "Key       : ${user}"
echo -e "Created   : $hariini"
echo -e "Expired   : $exp"
echo -e "=========================="
echo -e "Link TR  : ${trojanlink}"
echo -e "=========================="
echo -e "Script By KDevN9"