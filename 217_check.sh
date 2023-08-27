#!/bin/bash

check_passwd_maxclassrepeat(){
	if grep -q "^maxclassrepeat = 4" "/etc/security/pwquality.conf";
	then echo "Password maxclassrepeat is 4.(GCB 217 設置完成)"
		return 0
	else
		printf "Password maxclassrepeat not 4.(編輯/etc/security/pwquality.conf檔案，新增或修改成以下內容：maxclassrepeat = 4)\n"
		return 1
	fi
}

check_passwd_maxclassrepeat
