#!/bin/bash

check_avahi(){
	x=$(systemctl list-units | grep avahi-daemon.service)

	if [[ -z $x ]];
	then echo "avahi-daemon has been disabled.(GCB 95 設置完成)"
		return 0
	else
		echo "avahi-daemon is not disabled.(開啟終端機，執行以下指令停用avahi-daemon服務：systemctl --now disable avahi-daemon)"
		return 1
	fi
}

check_avahi
