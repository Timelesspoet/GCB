#!/bin/bash

check_bashrc(){
	if grep -q "^readonly TMOUT=900 ; export TMOUT" "/etc/bashrc";
	then echo "Time out is set.(GCB 238 步驟一設置完成)"
		return 0
	else
		echo "Time out not set.(編輯/etc/bashrc檔案，新增或修改參數如下：readonly TMOUT=900 ; export TMOUT)"
		return 1
	fi
}

check_bashrc
