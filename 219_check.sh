#!/bin/bash

check_passwd_dictcheck(){
	if grep -q "^dictcheck = 1" "/etc/security/pwquality.conf";
	then echo "Password dictcheck is 1.(GCB 219 設置完成)"
		return 0
	else
		printf "Password dictcheck not 1.(編輯/etc/security/pwquality.conf檔案，新增或修改成以下內容：dictcheck = 1)\n"
		return 1
	fi
}

check_passwd_dictcheck

