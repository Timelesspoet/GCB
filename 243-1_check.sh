#!/bin/bash

check_pam(){
	if grep -q "^auth required pam_wheel.so use_uid" "/etc/pam.d/su";
	then echo "pam_wheel.so is set.(GCB 243 步驟一設置完成)"
		return 0
	else 
		echo "pam_wheel.so not set.(編輯/etc/pam.d/su檔案，新增或修改成以下內容：auth required pam_wheel.so use_uid)"
		return 1
	fi
}

check_pam
