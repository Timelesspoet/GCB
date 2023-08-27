#!/bin/bash

check_user_inactive(){
	x=$(useradd -D)
	if [[ "$x" == *"INACTIVE=30"* ]];
	then echo "Account inactive is 30.(GCB 228 設置完成)"
		return 0
	else
		printf "Account inactive not 30.(開啟終端機，執行以下指令，設定密碼到期後的帳號停用：useradd -D -f 30\n針對進行上述設定前就已存在之使用者帳號，須再執行下列指令，才能使密碼到期後，超過30天就進行帳號停用：chage --inactive 30 (使用者帳號名稱))\n"
		return 1
	fi
}

check_user_inactive
