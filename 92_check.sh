#!/bin/bash

check_xinetd(){
	x=$(dnf list installed | grep xinetd)
	if [$x = ""];
	then echo "xinetd has been deleted.(GCB 92 設置完成)"
		return 0
	else
		echo "xinetd was not removed.(開啟終端機，執行以下指令移除xinetd套件：dnf remove xinetd)"
		return 1
	fi
}

check_xinetd
