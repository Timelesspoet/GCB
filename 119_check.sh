#!/bin/bash

check_ipv4_icmp_echo_ignore_broadcasts(){
	x=$(sysctl -a | grep net.ipv4.icmp_echo_ignore_broadcasts)
	if [ "$x" = "net.ipv4.icmp_echo_ignore_broadcasts = 1" ];
	then echo "Do not respond to ICMP broadcast requests.(GCB 119 設置完成)"
		return 0
	else
		echo 'Responding to ICMP broadcast requests.(開啟終端機，執行以下指令，將net.ipv4.icmp_echo_ignore_broadcasts設為1，以不回應ICMP廣播要求，並使變動立即生效：grep -Els "^\s*net\.ipv4\.icmp_echo_ignore_broadcasts\s*=\s*0" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf | while read filename; do sed -ri "s/^\s*(net\.ipv4\.icmp_echo_ignore_broadcasts\s*)(=)(\s*\S+\b).*$/# *REMOVED* \1/" $filename; done; sysctl -w net.ipv4.icmp_echo_ignore_broadcasts=1; sysctl -w net.ipv4.route.flush=1)'
		return 1
	fi
}

check_ipv4_icmp_echo_ignore_broadcasts
