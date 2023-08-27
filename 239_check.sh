#!/bin/bash

check_gui_setting_lock(){
	if grep -qE "^/org/gnome/desktop/session/idle-delay" "/etc/dconf/db/local.d/locks/session";
		then if grep -qE "^/org/gnome/desktop/screensaver/lock-enabled" "/etc/dconf/db/local.d/locks/session";
        		then if grep -qE "^/org/gnome/desktop/screensaver/lock-delay" "/etc/dconf/db/local.d/locks/session";
        			then if grep -qE "^/org/gnome/desktop/lockdown/disable-lock-screen" "/etc/dconf/db/local.d/locks/session";
        				then echo "GUI Setting is locked.(GCB 239 設置完成)"
					return 0
				else
                printf "GUI Setting not locked.(開啟終端機，執行以下指令，建立或
編輯資料庫，設定防止修改圖形使用者介面(GUI)設定：vim /etc/dconf/db/local.d/locks/session\n編輯資料庫，新增或修改成以下內容：\n/org/gnome/desktop/session/idle-delay\n/org/gnome/desktop/screensaver/lock-enabled\n/org/gnome/desktop/screensaver/lock-delay\n/org/gnome/desktop/lockdown/disable-lock-screen)\n"
                return 1

				fi
				else
                printf "GUI Setting not locked.(開啟終端機，執行以下指令，建立或
編輯資料庫，設定防止修改圖形使用者介面(GUI)設定：vim /etc/dconf/db/local.d/locks/session\n編輯資料庫，新增或修改成以下內容：\n/org/gnome/desktop/session/idle-delay\n/org/gnome/desktop/screensaver/lock-enabled\n/org/gnome/desktop/screensaver/lock-delay\n/org/gnome/desktop/lockdown/disable-lock-screen)\n"
                return 1

			fi
			else
                printf "GUI Setting not locked.(開啟終端機，執行以下指令，建立或
編輯資料庫，設定防止修改圖形使用者介面(GUI)設定：vim /etc/dconf/db/local.d/locks/session\n編輯資料庫，新增或修改成以下內容：\n/org/gnome/desktop/session/idle-delay\n/org/gnome/desktop/screensaver/lock-enabled\n/org/gnome/desktop/screensaver/lock-delay\n/org/gnome/desktop/lockdown/disable-lock-screen)\n"
                return 1

		fi
	else
		printf "GUI Setting not locked.(開啟終端機，執行以下指令，建立或編輯資料庫，設定防止修改圖形使用者介面(GUI)設定：vim /etc/dconf/db/local.d/locks/session\n編輯資料庫，新增或修改成以下內容：\n/org/gnome/desktop/session/idle-delay\n/org/gnome/desktop/screensaver/lock-enabled\n/org/gnome/desktop/screensaver/lock-delay\n/org/gnome/desktop/lockdown/disable-lock-screen)\n"
		return 1
	fi
}

check_gui_setting_lock

