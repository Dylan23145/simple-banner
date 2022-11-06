pkg install cowsay 
pkg install jq
pkg install termux-api
clear
setterm -foreground green 
echo "INSTALA TERMUX API PARA EL CORRECTO FUNCIONAMIENTO"
echo "presiona enter"
termux-open https://f-droid.org/repo/com.termux.api_51.apk
read
#FUNCIONES

nick () { 
clear
termux-dialog -t "Cual es tu nick?" -i nick > .nick
}
huella () {
 echo 'hue=$(termux-fingerprint | jq -r ".auth_result")
 if [[ "$hue" = "AUTH_RESULT_SUCCESS" ]]
then
	usuario=$(cat .nick | jq -r ".text")
	termux-toast -b purple -c red "Bienvenido $usuario"
else
	termux-toast  "Bienvenido Invitado"
fi' >> /data/data/com.termux/files/usr/etc/bash.bashrc
}
vacas () {
termux-dialog -t "Que dira la vaca?" > .vacat
echo 'clear
setterm --foreground yellow
textov=$(cat .vacat | jq -r ".text")
cowsay $textov
date' >> /data/data/com.termux/files/usr/etc/bash.bashrc

}
clima () {
	echo 'ip=$(curl -s ifconfig.me) curl https://wttr.in/$ip?0?m' >> /data/data/com.termux/files/usr/etc/bash.bashrc
}
bateria () {
	echo 'setterm --foreground green
	porc=$(termux-battery-status | jq -r ".percentage")
	carg=$(termux-battery-status | jq -r ".status")
	temp=$(termux-battery-status | jq -r ".temperature")
	crg=$( if [[ $carg = "CHARGING" ]]
then
	echo "mobil cargando..."
fi )
echo "         bateria: $porc% $crg "
echo "       temperatura: $temp " ' >> /data/data/com.termux/files/usr/etc/bash.bashrc
}
#fin de las funciones
nick 
clear
while true; do
    read -p "Deseas una vaca con mensaje personalizado? [S/N]" op
    case $op in
      [Ss]* ) vacas; break;;
      [Nn]* ) echo " "; break;;
          * ) echo "Seleccione Si o No.";;
    esac
done
clear
while true; do
	read -p "Deseas saber el clima? [S/N]" op
	case $op in
	[Ss]* ) clima; break;;
	[Nn]* ) echo " "; break;;
	* ) echo "Seleccione Si o No.";;
esac
done
clear
while true; do
	read -p "Deseas saber el estado de la bateria? [S/N]" op
	case $op in
	[Ss]* ) bateria; break;;
	[Nn]* ) echo " "; break;;
	* ) echo "Seleccione Si o No.";;
esac
done
clear
while true; do
	read -p "Deseas un mensaje personalizado con tu huella?? [S/N]" op
	case $op in  

	[Ss]* ) huella; break;;
	[Nn]* ) echo " "; break;;
	* ) echo "Seleccione Si o No.";;
esac
done
echo ' setterm --foreground red
echo "       8D2 x $usuario"' >> /data/data/com.termux/files/usr/etc/bash.bashrc
bash
clear
echo -e "te invitamos a nuestro grupo de whatsapp\nte gustaria entrar?"
while true; do
	read -p "[S/N]" op
	case $op in  

	[Ss]* ) echo "muchas gracias" && termux-open https://chat.whatsapp.com/D15ogFUtIASK1DYMcnOSYx ; break;;
	[Nn]* ) echo "para la proxima, aqui el link: https://chat.whatsapp.com/D15ogFUtIASK1DYMcnOSYx "; break;;
	* ) echo "Seleccione Si o No.";;
esac
done

