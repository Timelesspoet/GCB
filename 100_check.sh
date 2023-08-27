#!/bin/bash

check_ypserv(){
	x=$(systemctl list-units | grep ypserv.service)

	if [[ -z $x ]];
	then echo "ypserv has been disabled.(GCB 100 設置完成)"
		return 0
	else
		echo "ypserv is not disabled.(開啟終端機，執行以下指令停用NIS伺服器服務(ypserv)：systemctl --now disable ypserv)"
		return 1
	fi
}

check_ypserv
