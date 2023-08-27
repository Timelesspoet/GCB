#!/bin/bash

check_passwd_ocredit(){
	if grep -q "^ocredit = -1" "/etc/security/pwquality.conf";
	then echo "Password ocredit is -1.(GCB 215 設置完成)"
		return 0
	else
		printf "Password ocredit not -1.(編輯/etc/security/pwquality.conf檔案，新增或修改成以下內容：ocredit = -1)\n"
		return 1
	fi
}

check_passwd_ocredit  
