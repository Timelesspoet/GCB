#!/bin/bash

check_kdump(){
	x=$(systemctl list-units | grep kdump.service)

	if [[ -z $x ]];
	then echo "kdump is not enabled.(開啟終端機，執行以下指令啟用kdump>服務：systemctl --now enable kdump.service)"
		return 0
	else
		echo "kdump has been enabled.(GCB 101 設置完成)"
		return 1
	fi
}

check_kdump
