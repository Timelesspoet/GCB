#!/bin/bash

check_wheel_group(){
	if grep -qE "^wheel:x:10:root," "/etc/group";
	then echo "Wheel group is set.(GCB 243 步驟二設置完成)"
		return 0
	else
		printf "Wheel group not set.(編輯/etc/group檔案之wheel群組設定，建立允許使用su指令的使用者帳號清單，如下所示：wheel:x:GID:root,(使用者帳號清單)\n範例：如欲在wheel群組(GID為10)建立允許root、user1及user2帳號使用su指令，內容如下wheel:x:10:root,user1,user2)\n"
		return 1
	fi
}

check_wheel_group
