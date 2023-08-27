#!/bin/bash

check_passwd_ucredit(){
	if grep -q "^ucredit = -1" "/etc/security/pwquality.conf";
	then echo "Password ucredit is -1.(GCB 213 設置完成)"
		return 0
	else
		printf "Password ucredit not -1.(編輯/etc/security/pwquality.conf檔案，新增或修改成以下內容：ucredit = -1)\n"
		return 1
	fi
}

check_passwd_ucredit
