#!/bin/bash

check_nologin(){
	if grep -q "nologin" "/etc/passwd";
	then echo "System account is locked.(GCB 237 設置完成)"
		return 0
	else
		printf "System account not locked.(開啟終端機，執行以下指令，設定系統帳號(sync、shutdown及halt帳號除外)不可使用殼層(Shell)登入：awk -F: '($1!="root" && $1!="sync" && $1!="shutdown" && $1!="halt" && $1!~/^\+/ && $3<'"$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)"' && $7!="'"$(which nologin)"'" && $7!="/bin/false") {print $1}' /etc/passwd | while read user; do usermod -s $(which nologin) $user; done\n執行以下指令，鎖定所有非root之系統帳號：\n#awk -F: '($1!="root" && $1!~/^\+/ && $3<'"$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)"') {print $1}' /etc/passwd | xargs -I '{}' passwd -S '{}' | awk '($2!="L" && $2!="LK") {print $1}' | while read user; do usermod -L $user; done\n)"
		return 1
	fi
}

check_nologin
