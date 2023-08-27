#!/bin/bash

check_passwd_minlen(){
	if grep -q "^minlen = 12" "/etc/security/pwquality.conf";
	then echo "Password minimum length is 12.(GCB 210 設置完成)"
		return 0
	else
		printf "Password minimum length not 12.(編輯/etc/security/pwquality.conf檔案，新增或修改成以下內容：minlen = 12)\n"
		return 1
	fi
}

check_passwd_minlen
