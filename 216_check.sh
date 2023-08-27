#!/bin/bash

check_passwd_difok(){
	if grep -q "^difok = 3" "/etc/security/pwquality.conf";
	then echo "Password difok is 3.(GCB 216 設置完成)"
		return 0
	else
		printf "Password difok not 3.(編輯/etc/security/pwquality.conf檔案，新增或修改成以下內容：difok = 3)\n"
		return 1
	fi
}

check_passwd_difok
