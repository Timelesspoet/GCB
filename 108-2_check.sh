#!/bin/bash

check_ipv6_forwarding(){
	x=$(sysctl -a | grep net.ipv6.conf.all.forwarding)
	if [ "$x" = "net.ipv6.conf.all.forwarding = 0" ];
	then echo "ipv6 forwarding is disabled.(GCB 108 ipv6 設置完成)"
		return 0
	else
		echo 'ipv6 forwarding not disabled.(開啟終端機，執行以下指令，將net.ipv6.conf.all.forwarding設為0，以停用IP轉送功能，並使變動立即生效：grep -Els "^\s*net\.ipv6\.conf\.all\.forwarding\s*=\s*1" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf | while read filename; do sed -ri "s/^\s*(net\.ipv6\.conf\.all\.forwarding\s*)(=)(\s*\S+\b).*$/# *REMOVED* \1/" $filename; done; sysctl -w net.ipv6.conf.all.forwarding=0; sysctl -w net.ipv6.route.flush=1)'
		return 1
	fi
}

check_ipv6_forwarding
