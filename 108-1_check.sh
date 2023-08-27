#!/bin/bash

check_ipv4_forward(){
	x=$(sysctl -a | grep net.ipv4.ip_forward)
	if [[ "$x" == "net.ipv4.ip_forward = 0"* ]];
	then echo "ipv4 forward is disabled.(GCB 108 ipv4設置完成)"
		return 0
	else
		echo 'ipv4 forward not disabled.(開啟終端機，執行以下指令，將net.ipv4.ip_forward設為0，以停用IP轉送功能，並使變動立即生效：grep -Els "^\s*net\.ipv4\.ip_forward\s*=\s*1" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf | while read filename; do sed -ri "s/^\s*(net\.ipv4\.ip_forward\s*)(=)(\s*\S+\b).*$/# *REMOVED* \1/" $filename; done; sysctl -w net.ipv4.ip_forward=0; sysctl -w net.ipv4.route.flush=1)'		
		return 1
	fi
}

check_ipv4_forward
