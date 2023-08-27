#!/bin/bash

check_passwd_retry(){
	if grep -q "retry=3" "/etc/authselect/password-auth";
	then echo "Password retry is 3.(GCB 208 設置完成)"
		return 0
	else
		printf "Password retry not 3.(開啟終端機，執行以下腳本，更新system-auth與password-auth檔案：\n#!/bin/bash\nCP=\$(authselect current | awk 'NR == 1 {print \$3}' | grep custom/)\nfor FN in system-auth password-auth; do\n[[ -n \$CP ]] && PTF=/etc/authselect/\$CP/\$FN || PTF=/etc/authselect/\$FN\n[[ -n \$(grep -E '^\s*password\s+requisite\s+pam_pwquality.so\s+.*\s+retry=\S+\s*.*$' \$PTF) ]] && sed -ri '/pwquality/s/retry=\S+/retry=3/' \$PTF || sed -ri 's/^\s*(password\s+requisite\s+pam_pwquality.so\s+)(.*)$/\1\2 retry=3/' \$PTF\ndone\nauthselect apply-changes)\n"
		return 1
	fi
}

check_passwd_retry
