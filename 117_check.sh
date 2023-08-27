#!/bin/bash

check_all_log_martians(){
	if grep -q "^net.ipv4.conf.all.log_martians = 1" "/etc/sysctl.conf";
		then echo "All log martians is enabled.(GCB 117 設置完成)"
		return 0
	else
		printf "All log martians is disabled.(編輯/etc/sysctl.conf檔案或/etc/sysctl.d/目錄下的檔案，新增或修改參數如下：net.ipv4.conf.all.log_martians = 1\n開啟終端機，執行以下指令設定核心參數：sysctl -w net.ipv4.conf.all.log_martians=1\n開啟終端機，執行以下指令使變動立即生效：sysctl -w net.ipv4.route.flush=1)\n"
		return 1
	fi
}

check_all_log_martians    
