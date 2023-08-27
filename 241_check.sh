#!/bin/bash

check_umask(){
	if grep -q "^umask 027" "/etc/profile";
	then echo "umask is 027.(GCB 241 設置完成)"
		return 0
	else 
		echo "umask not 027.(編輯/etc/profile檔案、/etc/profile.d/目錄下的「.sh」檔案及/etc/bashrc檔案，新增或修改參數如下：umask 027)"
		return 1
	fi
}

check_umask
