#!/bin/bash

check_ipv6_default_accept_ra(){
	if grep -q "^net.ipv6.conf.default.accept_ra = 0" "/etc/sysctl.conf";
	then echo "ipv6 default router advertisement is blocked.(GCB 125 設置完成)"
		return 0
	else
		printf "ipv6 default router advertisement is accepted.(編輯/etc/sysctl.conf檔案或/etc/sysctl.d/目錄下的檔案，新增或修改參數如下：net.ipv6.conf.default.accept_ra = 0\n開啟終端機，執行以下指令設定核心參數：sysctl -w net.ipv6.conf.default.accept_ra=0\n開啟終端機，執行以下指令使變動立即生效：sysctl -w net.ipv6.route.flush=1)\n"
		return 1
	fi
}

check_ipv6_default_accept_ra
