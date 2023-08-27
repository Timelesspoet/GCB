#!/bin/bash

check_ICMP_Send_Redirect(){
	if grep -q "^net.ipv4.conf.all.send_redirects = 0" "/etc/sysctl.conf";
	then echo "ICMP send redirect is disabled.(GCB 109 設置完成)"
		return 0
	else
		printf "ICMP send redirect not disabled.(編輯/etc/sysctl.conf檔案或/etc/sysctl.d/目錄下的檔案，新增或修改參數如下：net.ipv4.conf.all.send_redirects = 0\n開啟終端機，執行以下指令設定核心參數：sysctl -w net.ipv4.conf.all.send_redirects=0\n開啟終端機，執行以下指令使變動立即生效：\nsysctl -w net.ipv4.route.flush=1)\n"
		return 1
	fi
}

check_ICMP_Send_Redirect
