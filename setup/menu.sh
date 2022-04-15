#!/bin/bash
#Menu

RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0;37m'
clear
MYIP=$(curl -sS ipv4.icanhazip.com)
name=$(curl -sS https://raw.githubusercontent.com/geovpn/perizinan/main/main/allow | grep $MYIP | awk '{print $2}')
exp=$(curl -sS https://raw.githubusercontent.com/geovpn/perizinan/main/main/allow | grep $MYIP | awk '{print $3}')
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}║       AutoScript VPN Mod By geovpn         ║${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "Uptime : $(neofetch | grep Uptime | cut -d " " -f 2-100)"
echo -e "Domain : $(cat /etc/xray/domain)"
echo -e "IP VPS : $MYIP"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
echo -e "[${CYAN}1${NC}] • >> SSH / OPenVPN Menu"
echo -e "[${CYAN}2${NC}] • >> L2TP PPTP & SSTP Menu"
echo -e "[${CYAN}3${NC}] • >> Wireguard Menu"
echo -e "[${CYAN}4${NC}] • >> SS / SSR Menu"
echo -e "[${CYAN}5${NC}] • >> XRay Core Menu"
echo -e "[${CYAN}6${NC}] • >> V2Ray Core Menu"
echo -e "[${CYAN}7${NC}] • >> ALL TRial Menu"
echo -e "[${CYAN}8${NC}] • >> System  Menu"
echo -e ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "Version : ${BLUE}$(cat /home/ver)${NC}"
echo -e "Client Name : $name"
echo -e "Expired Date : $exp"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "Telegram : t.me/sampiiiiu"
echo -e "Github   : https://github.com/geovpn"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
read -p "Select Menu Options [ 1 - 7 ] : " menu
case $menu in
1)
menu-ssh
;;
2)
menu-accel
;;
3)
menu-wg
;;
4)
menu-ssr
;;
5)
menu-xray
;;
6)
menu-v2ray
;;
7)
trial-menu
;;
8)
system-menu
;;
*)
clear
menu
;;
esac