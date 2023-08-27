#!/bin/bash

check_kdb_install(){
	x=$(dnf list installed | grep kbd.x86_64)

	if [[ "$x" != "" ]];
	then echo "kbd is installed.(GCB 233 設置完成)"
		return 0
	else
		echo "kdb not installed.(開啟終端機，執行以下指令，安裝kbd套件：dnf install kbd.x86_64)"
		return 1
	fi
}

check_kdb_install
