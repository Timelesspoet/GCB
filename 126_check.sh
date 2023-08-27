#!/bin/bash

check_DCCP_disable(){
	if grep -q '^install dccp /bin/true' "/etc/modprobe.d/dccp.conf" && grep -q '^blacklist dccp' "/etc/modprobe.d/dccp.conf";
	then echo "DCCP is disable.(GCB 126 設置完成)"
		return 0
	else
		printf "DCCP is enabled.(開啟終端機，執行vim指令，在/etc/modprobe.d目錄，新增或編輯「dccp.conf」檔案，範例如下：vim /etc/modprobe.d/dccp.conf\n並在檔案中加入以下內容：\ninstall dccp /bin/true\nblacklist dccp\n完成後，請重新開機)\n"
		return 1
	fi
}

check_DCCP_disable
