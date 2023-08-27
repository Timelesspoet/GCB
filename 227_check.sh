#!/bin/bash

check_PASS_MAX_DAYS(){
	if grep -q "^PASS_MAX_DAYS	90" "/etc/login.defs";
	then echo "Password maximum age is 90.(GCB 227 設置完成)"
		return 0
	else
		printf "Password maximum age not 90.(編輯/etc/login.defs檔案，設定PASS_MAX_DAYS參數如下：PASS_MAX_DAYS 90\n針對進行上述設定前就已存在之使用者帳號，須再執行下列指令，才能使密碼到期前14天提醒使用者變更密碼：chage --maxdays 90(使用者帳號名稱))\n"
		return 1
	fi
}

check_PASS_MAX_DAYS

