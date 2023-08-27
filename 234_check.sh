#!/bin/bash

check_lock(){
	if grep -q "^lock-enabled=true" "/etc/dconf/db/local.d/00-screensaver";
	then echo "screensaver is set.(GCB 234 設置完成)"
		return 0
	else
		printf "screensaver not set.(開啟終端機，執行以下指令，建立或編輯資料庫，設定螢幕保護裝置：vim /etc/dconf/db/local.d/00-screensaver\n編輯資料庫的「org/gnome/desktop/screensaver」段落，新增或修改成以下內容：\n[org/gnome/desktop/screensaver]\n##Set this to true to lock the screen when the screensaver activates\nlock-enabled=true\n執行以下指令更新系統資料庫：dconf update)\n"
		return 1
	fi
}

check_lock
