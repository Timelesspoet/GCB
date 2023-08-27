#!/bin/bash

check_FAIL_DELAY(){
	if grep -q "^FAIL_DELAY		4" "/etc/login.defs";
	then echo "Login fail delay is 4.(GCB 229 設置完成)"
		return 0
	else
		printf "Login fail delay not 4.(編輯/etc/login.defs檔案，將FAIL_DELAY參數值設為4以上，範例如下：FAIL_DELAY 4)\n"
		return 1
	fi
}

check_FAIL_DELAY
