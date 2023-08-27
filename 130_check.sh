#!/bin/bash

check_wifi_off(){
	x=$(sudo nmcli radio all)
	if [[ "$x" != *"已啟用"* ]]; then
		echo "Wireless network interface is disabled.(GCB 130 設置完成)"
		return 0
	else
		echo "Wireless network interface is enabled.(開啟終端機，執行以下指令，停用所有無線介面：nmcli radio all off)"
		return 1
	fi

}

check_wifi_off
