#!/bin/bash

check_SCTP_disable(){
	if grep -q '^install sctp /bin/true' "/etc/modprobe.d/sctp.conf" && grep -q '^blacklist sctp' "/etc/modprobe.d/sctp.conf";
	then echo "SCTP is disable.(GCB 127 設置完成)"
		return 0
	else
		printf "SCTP is enabled.(開啟終端機，執行vim指令，在/etc/modprobe.d目錄，新增或編輯「sctp.conf」檔案，範例如下：vim /etc/modprobe.d/sctp.conf\n並在檔案中加入以下內容：\ninstall sctp /bin/true\nblacklist sctp\n完成後，請重新開機)\n"
		return 1
	fi
}

check_SCTP_disable
