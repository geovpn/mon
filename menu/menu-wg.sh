#!/bin/bash
clear
echo "╔═════════════════════════════════════════════════════════════════╗"
echo "║                       ┃ Wireguard Menu ┃                        ║" 
echo "╚═════════════════════════════════════════════════════════════════╝" 
echo "║ 1.Create Account Wireguard                                      ║"
echo "║ 2.Delete Account Wireguard                                      ║"
echo "║ 3.Extending Account Wireguard Active Life                       ║"
echo "║ 4.Exit                                                          ║" 
echo "╚═════════════════════════════════════════════════════════════════╝" 
read -p "     Select From Options [1-4] :  " menu
case $menu in 
1)
addwg
;;
2)
delwg
;;
3)
renewwg
;;
4)
exit
;;
*)
echo "Input The Correct Number !"
;;
esac
