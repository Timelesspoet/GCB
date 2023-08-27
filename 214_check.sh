#!/bin/bash

check_passwd_lcredit(){
	if grep -q "^lcredit = -1" "/etc/security/pwquality.conf";
	then echo "Password lcredit is -1.(GCB 214 設置完成)"
		return 0
	else
		printf "Password lcredit not -1.(編輯/etc/security/pwquality.conf檔案，新增或修改成以下內容：lcredit = -1)\n"
		return 1
	fi
}

check_passwd_lcredit
