#!/bin/bash

check_postlogin(){
	if grep -q "^session required pam_lastlog.so showfailed" "/etc/pam.d/postlogin";
	then echo "Show failed logins.(GCB 223 設置完成)"
		return 0
	else
		printf "Hidden failed logins.(編輯/etc/pam.d/postlogin檔案，新增或修改以下內容至檔案最上方：session required pam_lastlog.so showfailed)\n"
		return 1
	fi
}

check_postlogin
