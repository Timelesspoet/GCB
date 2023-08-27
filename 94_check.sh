#!/bin/bash

check_rsyncd(){
	x=$(systemctl list-units | grep rsyncd)
	if [$x = ""];
	then echo "rsyncd has been disabled.(GCB 94 設置完成)"
		return 0
	else
		echo "rsyncd is not disabled.(開啟終端機，執行以下指令停用rsyncd服務：systemctl --now disable rsyncd)"
		return 1
	fi
}

check_rsyncd
