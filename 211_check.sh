#!/bin/bash

check_passwd_minclass(){
	if grep -q "^minclass = 4" "/etc/security/pwquality.conf";
	then echo "Password minimum class is 4.(GCB 211 設置完成)"
		return 0
	else
		printf "Password minimum class not 4.(編輯/etc/security/pwquality.conf檔案，新增或修改成以下內容：minclass = 4)\n"
		return 1
	fi
}

check_passwd_minclass
