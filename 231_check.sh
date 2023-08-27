#!/bin/bash

filter(){
	grep -v "#" "/etc/sudoers" > temp
}
check_NOPASSWD(){
		if grep -q "NOPASSWD" temp;
			then echo "NOPASSWD is set.(GCB 231 設置完成)"
			rm temp
			return 0
		elif grep -q "authenticate" "/etc/sudoers";
		then echo "authenticate is set.(GCB 231 設置完成)"
			rm temp
			return 0
		else
			echo "Neither NOPASSWD nor authenticate is set.( 執行「visudo -f」指令編輯/etc/sudoers檔案或 /etc/sudoers.d/目錄下的檔案，針對包含「NOPASSWD」或「!authenticate」的指令行，予以註解(#)或刪除)"
			rm temp
			return 1
		fi
}

filter
check_NOPASSWD
