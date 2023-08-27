#!/bin/bash

check_ICMP_all_accept_redirects(){
	if grep -q "^net.ipv4.conf.all.accept_redirects = 0" "/etc/sysctl.conf";
		then
		       if grep -q "^net.ipv6.conf.all.accept_redirects = 0" "/etc/sysctl.conf";
		       then echo "ICMP all accept redirects blocked.(GCB 113 設置完成)"
			       return 0
		       else
			       printf "ipv6 ICMP all accept redirects accepted.(編輯/etc/sysctl.conf檔案或/etc/sysctl.d/目錄下的檔案，新增或修改參數如下：net.ipv6.conf.all.accept_redirects = 0\n開啟終端機，執行以下指令設定核心參數：sysctl -w net.ipv6.conf.all.accept_redirects=0\n開啟終端機，執行以下指令使變動立即生效：sysctl -w net.ipv6.route.flush=1)\n"
			       return 1
		       fi
	else
		printf "ipv4 ICMP all accept redirects accepted.(編輯/etc/sysctl.conf檔案或/etc/sysctl.d/目錄下的檔案，新增或修改參數如下：net.ipv4.conf.all.accept_redirects = 0\n開啟終端機，執行以下指令設定核心參數：sysctl -w net.ipv4.conf.all.accept_redirects=0\n開啟終端機，執行以下指令使變動立即生效：sysctl -w net.ipv4.route.flush=1)\n"
		return 1
	fi
}

check_ICMP_all_accept_redirects
