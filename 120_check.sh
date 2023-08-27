#!/bin/bash

check_ipv4_icmp_ignore_bogus_error_responses(){
	x=$(sysctl -a | grep net.ipv4.icmp_ignore_bogus_error_responses)
	if [ "$x" = "net.ipv4.icmp_ignore_bogus_error_responses = 1" ];
	then echo "Ignore bogus ICMP error messages.(GCB 120 設置完成)"
		return 0
	else
		echo 'Respond to bogus ICMP error messages.(開啟終端機，執行以下指令，將net.ipv4.icmp_ignore_bogus_error_responses設為1，以忽略偽造的ICMP錯誤訊息，並使變動立即生效：grep -Els "^\s*net\.ipv4\.icmp_ignore_bogus_error_responses\s*=\s*0" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf | while read filename; do sed -ri "s/^\s*(net\.ipv4\.icmp_ignore_bogus_error_responses\s*)(=)(\s*\S+\b).*$/# *REMOVED* \1/" $filename; done; sysctl -w net.ipv4.icmp_ignore_bogus_error_responses=1; sysctl -w net.ipv4.route.flush=1)'
		return 1
	fi
}

check_ipv4_icmp_ignore_bogus_error_responses
