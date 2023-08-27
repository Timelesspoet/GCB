#!/bin/bash

check_RDS_disable(){
	if grep -q '^install rds /bin/true' "/etc/modprobe.d/rds.conf" && grep -q '^blacklist rds' "/etc/modprobe.d/rds.conf";
	then echo "RDS is disable.(GCB 128 設置完成)"
		return 0
	else
		printf "RDS is enabled.(開啟終端機，執行vim指令，在/etc/modprobe.d目錄，新增或編輯「rds.conf」檔案，範例如下：vim /etc/modprobe.d/rds.conf\n並在檔案中加入以下內容：\ninstall rds /bin/true\nblacklist rds\n完成後，請重新開機)\n"
		return 1
	fi
}

check_RDS_disable
