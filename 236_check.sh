#!/bin/bash

check_AutomaticLogin(){
	if grep -q "^AutomaticLoginEnable=false" "/etc/gdm/custom.conf";
	then echo "AutomaticLogin is closed.(GCB 236 設置完成)"
		return 0
	else
		printf "AutomaticLogin not closed.(編輯/etc/gdm/custom.conf檔案，在「daemon]」段落，新增或修改成以下內容：\n[daemon]\nAutomaticLoginEnable=false)\n"
		return 1
	fi
}

check_AutomaticLogin
