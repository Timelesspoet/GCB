#!/bin/bash

check_passwd_dcredit(){
	if grep -q "^dcredit = -1" "/etc/security/pwquality.conf";
	then echo "Password dcredit is -1.(GCB 212 設置完成)"
		return 0
	else
		printf "Password dcredit not -1.(編輯/etc/security/pwquality.conf檔案，新增或修改成以下內容：dcredit = -1)\n"
		return 1
	fi
}

check_passwd_dcredit
