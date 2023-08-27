#!/bin/bash

check_usermod(){
	if grep -q "root:x:0:0" "/etc/passwd";
	then echo "root GID is 0.(GCB 240 設置完成)"
		return 0
	else 
		echo "root GID not 0.(開啟終端機，執行以下指令，設定root帳號所屬群組：usermod -g 0 root)"
		return 1
	fi
}

check_usermod
