#!/bin/bash
clear
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║                         ┃ XRay Menu ┃                          ║" 
echo "╚════════════════════════════════════════════════════════════════╝" 
echo "║ 1.Create XRay VMess Accounts                                   ║"
echo "║ 2.Create XRay VLess Accounts                                   ║"
echo "║ 3.Create XRay Trojan Accounts                                  ║"
echo "║ 4.Create XRay XTLS Accounts                                    ║"
echo "║ 5.Create XRay GRPC Accounts                                    ║"
echo "║                                                                ║"
echo "║ 6.Delete Account Xray Vmess Websocket                          ║"
echo "║ 7.Delete Account Xray Vless Websocket                          ║"
echo "║ 8.Delete Account Xray Trojan                                   ║"
echo "║ 9.Delete Account Xray XTLS                                     ║"
echo "║ 10.Delete Account Xray GRPC                                    ║"
echo "║                                                                ║"
echo "║ 11.Renew Xray VMess Accounts                                   ║"
echo "║ 12.Renew Xray VLess Accounts                                   ║"
echo "║ 13.Renew Xray Trojan Accounts                                  ║"
echo "║ 14.Renew Xray XTLS Accounts                                    ║"
echo "║ 15.Renew Xray GRPC Accounts                                    ║"
echo "║                                                                ║"
echo "║ 16.Check User Login Xray Vmess                                 ║"
echo "║ 17.Check User Login Xray Vless                                 ║"
echo "║ 18.Check User Login Xray Trojan                                ║"
echo "║ 19.Check User Login Xray XTLS                                  ║"
echo "║ 20.Check User Login Xray GRPC                                  ║"  
echo "║  x.Exit                                                        ║"                                                  
echo "╚════════════════════════════════════════════════════════════════╝" 
read -p "     Select From Options [1-20] :  " menu
case $menu in 
1)
addxvmess
;;
2)
addxvless
;;
3)
addxtrojan
;;
4)
addxtls
;;
5)
addgrpc
;;
6)
delxvmess
;;
7)
delxvless
;;
8)
delxtrojan
;;
9)
delxtls
;;
10)
delgrpc
;;
11)
renewxvmess
;;
12)
renewxvless
;;
13)
renewxtrojan
;;
14)
renewxtls
;;
15)
renewgrpc
;;
16)
cekxvmess
;;
17)
cekxvless
;;
18)
cekxtrojan
;;
19)
cekxtls
;;
20)
cekgrpc
;;
x)
exit
;;
*)
echo "Input The Correct Number !"
;;
esac



