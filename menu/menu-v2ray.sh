#!/bin/bash
clear
echo "╔═════════════════════════════════════════════════════════════════╗"
echo "║                      ┃ V2Ray Core MENU ┃                        ║" 
echo "╚═════════════════════════════════════════════════════════════════╝" 
echo "║ 1.Create Account VMess                                          ║"
echo "║ 2.Create Account VLess                                          ║"
echo "║ 3.Create Account Trojan                                         ║"
echo "║ 4.Delete Account VMess                                          ║"
echo "║ 5.Delete Account VLess                                          ║"
echo "║ 6.Delete Account Trojan                                         ║"
echo "║ 7.Renews Account VMess                                          ║"
echo "║ 8.Renews Account VLess                                          ║"
echo "║ 9.Renews Account Trojan                                         ║"
echo "║ 10.Exit Menu                                                    ║"
echo "╚═════════════════════════════════════════════════════════════════╝" 
read -p "     Select From Options [1-10 ] :  " menu
case $menu in 
1)
addvmess
;;
2)
addvless
;;
3)
addtrojan
;;
4)
delvmess
;;
5)
delvless
;;
6)
deltrojan
;;
7)
renewvmess
;;
8)
renewtrojan
;;
9)
renewvless
;;
10)
exit
;;
*)
echo "Input The Correct Number !"
;;
esac
