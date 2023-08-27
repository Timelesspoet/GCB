#!/bin/bash

check_squid(){
	x=$(systemctl list-units | grep squid.service)

	if [[ -z $x ]];
	then echo "squid has been disabled.(GCB 97 設置完成)"
		return 0
	else
		echo "squid is not disabled.(開啟終端機，執行以下指令停用Squid服務：systemctl --now disable squid)"
		return 1
	fi
}

check_squid
