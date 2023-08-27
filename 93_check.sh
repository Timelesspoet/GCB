#!/bin/bash

check_chrony(){
	if grep -q "^server" "/etc/chrony.conf";
	then echo "NTP server is configured.(GCB 93 設置完成)"
		return 0
	elif grep -q "^pool" "/etc/chrony.conf";
		then echo "NTP pool is configured.(GCB 93 設置完成)"
		return 0
	else
		echo "Neither NTP server nor pool is configured.(編輯/etc/chrony.conf檔案，新增或修改NTP伺服器設定，範例如下：server (NTP伺服器名稱)或pool (NTP池名稱))"
		return 1
	fi
}

check_chrony
