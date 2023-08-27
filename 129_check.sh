#!/bin/bash

check_TIPC_disable(){
	if grep -q '^install tipc /bin/true' "/etc/modprobe.d/tipc.conf" && grep -q '^blacklist tipc' "/etc/modprobe.d/tipc.conf";
	then echo "TIPC is disable.(GCB 129 設置完成)"
		return 0
	else
		printf "TIPC is enabled.(開啟終端機，執行vim指令，在/etc/modprobe.d目錄，新增或編輯「tipc.conf」檔案，範例如下：vim /etc/modprobe.d/tipc.conf\n並在檔案中加入以下內容：\ninstall tipc /bin/true\nblacklist tipc\n完成後，請重新開機)\n"
		return 1
	fi
}

check_TIPC_disable
