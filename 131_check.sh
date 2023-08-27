#!/bin/bash

check_promiscuous_mode_off(){
	x=$(ip link | grep -i promisc)
	if [[ "$x" == "" ]] ;
	then echo "Promiscuous mode is disabled.(GCB 131 設置完成)"
		return 0
	else
		printf "Promiscuous mode is enabled.(開啟終端機，執行以下指令，檢查網路介面是否處於混雜模式：ip link | grep -i promisc\n若發現網路介面處於混雜模式，則執行以下指令，關閉網路介面混雜模式：ip link set dev (網路介面裝置名稱) multicast off promisc off)\n"
		return 1
	fi
}

check_promiscuous_mode_off

