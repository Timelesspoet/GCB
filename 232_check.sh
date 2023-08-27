#!/bin/bash

check_maxlogins(){
	if grep -q "^hard maxlogins 10" "/etc/security/limits.conf";
	then echo "maxlogins is set.(GCB 232 設置完成)"
		return 0
	else
		echo "maxlogins not set.(編輯/etc/security/limits.conf檔案或/etc/security/limits.d/目錄下的「.conf」檔案，新增或修改成以下內容：hard maxlogins 10)"
		return 1
	fi
}

check_maxlogins
