#!/bin/bash

check_PASS_MIN_DAYS(){
	if grep -q "^PASS_MIN_DAYS	1" "/etc/login.defs";
	then echo "Password minimum days is 1.(GCB 225 設置完成)"
		return 0
	else
		printf "Password minimum days not 1.(編輯/etc/login.defs檔案，設定PASS_MIN_DAYS參數如下：PASS_MIN_DAYS 1\n針對進行上述設定前就已存在之使用者帳號，須再執行下列指令，使該帳號之密碼最短使用期限變更為1天：chage --mindays 1 (使用者帳號名稱))\n"
		return 1
	fi
}

check_PASS_MIN_DAYS
