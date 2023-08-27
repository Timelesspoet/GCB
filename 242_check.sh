#!/bin/bash

check_UMASK(){
	if grep -q "^UMASK 027" "/etc/login.defs";
	then echo "UMASK is 027.(GCB 242 設置完成)"
		return 0
	else
		echo "UMASK not 027.(編輯/etc/login.defs檔案，設定UMASK參數值如下：UMASK 027)"
		return 1
	fi
}

check_UMASK
