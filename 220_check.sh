#!/bin/bash

check_deny(){
	if grep -q "deny=5" "/etc/authselect/password-auth";
	then echo "Failed login attempts is 5.(GCB 220 設置完成)"
		return 0
	else
		printf "Failed login attempts not 5.(開啟終端機，執行以下腳本，新增或修改設定為「deny=5」，更新system-auth與password-auth檔案：\n#!/bin/bash\nCP=\$(authselect current | awk 'NR == 1 {print \$3}' | grep custom/)\nfor FN in system-auth password-auth; do\n[[ -n \$CP ]] && PTF=/etc/authselect/\$CP/\$FN || PTF=/etc/authselect/\$FN\n[[ -n \$(grep -E '^\s*auth\s+required\s+pam_faillock.so\s+.*deny=\S+\s*.*$' \$PTF) ]] && sed -ri '/pam_faillock.so/s/deny=\S+/deny=5/g' \$PTF || sed -ri 's/^\^\s*(auth\s+required\s+pam_faillock\.so\s+)(.*[^{}])(\{.*\}|)$/\1\2 deny=5 \3/' \$PTF\ndone\nauthselect apply-changes)\n"
		return 1
	fi
}

check_deny
