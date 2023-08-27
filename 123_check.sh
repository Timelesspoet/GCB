#!/bin/bash

check_ipv4_tcp_syncookies(){
	x=$(sysctl -a | grep net.ipv4.tcp_syncookies)
	if [ "$x" = "net.ipv4.tcp_syncookies = 1" ];
	then echo "TCP SYN cookies is enabled.(GCB 123 設置完成)"
		return 0
	else
		echo 'TCP SYN cookies is disabled.(開啟終端機，執行以下指令，將net.ipv4.tcp_syncookies設為1，以啟用TCP SYN cookies功能，並使變動立即生效：grep -Els "^\s*net\.ipv4\.tcp_syncookies\s*=\s*[02]*" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf | while read filename; do sed -ri "s/^\s*(net\.ipv4\.tcp_syncookies\s*)(=)(\s*\S+\b).*$/# *REMOVED* \1/" $filename; done; sysctl -w net.ipv4.tcp_syncookies=1; sysctl -w net.ipv4.route.flush=1)'
		return 1
	fi
}

check_ipv4_tcp_syncookies
