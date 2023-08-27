#!/bin/bash

check_unlock_time(){
	if grep -q "unlock_time=900" "/etc/authselect/system-auth";
	then echo "Unlock time is 900.(GCB 221 設置完成)"
		return 0
	else
		printf "Unlock time not 900.(開啟終端機，執行以下腳本，新增或修改設定為「deny=5」與「unlock_time=900」，更新system-auth與password-auth檔案：\n#!/bin/bash\nCP=\$(authselect current | awk 'NR == 1 {print \$3}' | grep custom/)\nfor FN in system-auth password-auth; do\n[[ -n \$CP ]] && PTF=/etc/authselect/\$CP/\$FN || PTF=/etc/authselect/\$FN\n[[ -n \$(grep -E '^\s*auth\s+required\s+pam_faillock.so\s+.*unlock_time=\S+\s*.*$' \$PTF) ]] && sed -ri '/pam_faillock.so/s/unlock_time=\S+/unlock_time=900/g' \$PTF || sed -ri 's/^\s*(auth\s+required\s+pam_faillock\.so\s+)(.*[^{}])(\{.*\}|)$/\1\2 unlock_time=900 \3/' \$PTF\ndone\nauthselect apply-changes)\n"
		return 1
	fi
}

check_unlock_time
