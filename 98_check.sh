#!/bin/bash

check_smb(){
	x=$(systemctl list-units | grep smb.service)

	if [[ -z $x ]];
		then echo "smb has been disabled.(GCB 98 設置完成)"
		return 0
	else
		echo "smb is not disabled.(開啟終端機，執行以下指令停用Samba服務：systemctl --now disable smb)"
		return 1
	fi
}

check_smb
