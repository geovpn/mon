#!/bin/bash
#Menu
clear
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                          ┃ SSH MENU ┃                            ║" 
echo "╚══════════════════════════════════════════════════════════════════╝" 
echo "║ 1.Create SSH & OpenVPN Account                                   ║"
echo "║ 2.Generate SSH & OpenVPN Trial Account                           ║"
echo "║ 3.Extending SSH & OpenVPN Account Active Life                    ║"
echo "║ 4.Check User Login SSH & OpenVPN                                 ║"
echo "║ 5.Member SSH & OpenVPN                                           ║"
echo "║ 6.Delete SSH & OpenVpn Account                                   ║"
echo "║ 7.Delete User Expired SSH & OpenVPN                              ║"
echo "║ 8.Set up Autokill SSH                                            ║"
echo "║ 9.Displays Users Who Do Multi Login SSH                          ║"
echo "║ 10.Restart All Service                                           ║"
echo "║ x.Exit Menu                                                      ║"
echo "╚══════════════════════════════════════════════════════════════════╝" 
read -p "     Select From Options [1-10 or x] :  " menu
case $menu in 
1)
addssh
;;
2)
trialssh
;;
3)
renewssh
;;
4)
cekssh
;;
5)
member
;;
6)
delssh
;;
7)
delexp
;;
8)
autokill
;;
9)
ceklim
;;
10)
restart
;;
x)
menu
;;
*)
echo "Input The Correct Number !"
;;
esac
