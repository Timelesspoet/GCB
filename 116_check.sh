#!/bin/bash

check_default_secure_redirects(){
	if grep -q "^net.ipv4.conf.default.secure_redirects = 0" "/etc/sysctl.conf";
	then echo "Default secure redirects blocked.(GCB 116 設置完成)"
		return 0
	else
		printf "Default secure redirects accepted.(編輯/etc/sysctl.conf檔案或/etc/sysctl.d/目錄下的檔案，新增或修改參數如下：net.ipv4.conf.default.secure_redirects = 0\n開啟終端機，執行以下指令設定核心參數：sysctl -w net.ipv4.conf.default.secure_redirects=0\n開啟終端機，執行以下指令使變動立即生效：sysctl -w net.ipv4.route.flush=1)\n"
		return 1
	fi
}

check_default_secure_redirects
