#!/bin/bash

check_CREATE_HOME_yes(){
	if grep -q "^CREATE_HOME yes" "/etc/login.defs";
		then echo "CREATE_HOME is yes.(GCB 230 設置完成)"
		return 0
	else
		echo "CREATE_HOME not yes.(編輯/etc/login.defs檔案，設定CREATE_HOME參數如下：CREATE_HOME yes)"
		return 1
	fi
}

check_CREATE_HOME_yes
