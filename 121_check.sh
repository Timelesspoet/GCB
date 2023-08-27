#!/bin/bash

check_ipv4_rp_filter(){
	x=$(sysctl -a | grep net.ipv4.conf.all.rp_filter)
	if [ "$x" = "net.ipv4.conf.all.rp_filter = 1" ];
	then echo "Reverse path filtering is enabled.(GCB 121 設置完成)"
		return 0
	else
		echo 'Reverse path filtering is disabled.(開啟終端機，執行以下指令，將net.ipv4.conf.all.rp_filter設為1，以啟用逆向路徑過濾功能，並使變動立即生效：grep -Els "^\s*net\.ipv4\.conf\.all\.rp_filter\s*=\s*0" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf | while read filename; do sed -ri "s/^\s*(net\.ipv4\.net.ipv4.conf\.all\.rp_filter\s*)(=)(\s*\S+\b).*$/# *REMOVED* \1/" $filename; done; sysctl -w net.ipv4.conf.all.rp_filter=1; sysctl -w net.ipv4.route.flush=1)'
		return 1
	fi
}

check_ipv4_rp_filter
