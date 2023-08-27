#!/bin/bash

check_vsftpd(){
	x=$(systemctl list-units | grep vsftpd.service)

	if [[ -z $x ]];
	then echo "vsftpd has been disabled.(GCB 99 設置完成)"
		return 0
	else
		echo "vsftpd is not disabled.(開啟終端機，執行以下指令停用FTP伺服器服務(vsftpd)：systemctl --now disable vsftpd)"
		return 1
	fi
}

check_vsftpd
