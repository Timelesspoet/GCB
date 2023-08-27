#!/bin/bash

check_GNOME_idle(){
	if grep -q "^idle-delay=uint32 900" "/etc/dconf/db/local.d/00-screensaver";
	then echo "idle-delay is set.(GCB 235 設置完成)"
		return 0
	else
		printf "screensaver not set.(開啟終端機，執行以下指令，建立或編>輯資料庫，設定螢幕保護裝置：vim /etc/dconf/db/local.d/00-screensaver\n編輯資料庫
的「org/gnome/desktop/screensaver」段落，新增或修改成以下內容：\n[org/gnome/desktop/screensaver]\n##Set the lock time out to 900 seconds before the session is considered idle\nidle-delay=uint32 900\n執行以下指令更新系統資料庫：dconf update)\n"
		return 1
	fi
}

check_GNOME_idle
