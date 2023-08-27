#!/bin/bash

check_passwd_maxrepeat(){
	if grep -q "^maxrepeat = 3" "/etc/security/pwquality.conf";
	then echo "Password maxrepeat is 3.(GCB 218 設置完成)"
		return 0
	else
		printf "Password maxrepeat not 3.(編輯/etc/security/pwquality.conf檔案，新增或修改成以下內容：maxrepeat = 3)\n"
		return 1
	fi
}

check_passwd_maxrepeat
