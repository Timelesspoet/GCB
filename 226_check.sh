#!/bin/bash

check_PASS_WARN_AGE(){
	if grep -q "^PASS_WARN_AGE	14" "/etc/login.defs";
	then echo "Password warn days is 14.(GCB 226 設置完成)"
		return 0
	else
		printf "Password warn days not 14.(編輯/etc/login.defs檔案，設定PASS_WARN_AGE參數如下：PASS_WARN_AGE 14\n針對進行上述設定前就已存在之使用者帳號，須再執行下列指令，才能使密碼到期前14天提醒使用者變更密碼：chage --warndays 14 (使用者帳號名稱))\n"
		return 1
	fi
}

check_PASS_WARN_AGE

