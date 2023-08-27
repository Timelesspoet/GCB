#!/bin/bash

check_passwd_Enforce(){
	if grep -q "enforce_for_root" "/etc/authselect/password-auth";
	then echo "Enforce for root is enabled.(GCB 209 設置完成)"
		return 0
	else
		printf "Enforce for root is disabled.(開啟終端機，執行以下腳本，更新system-auth與password-auth檔案：\n#!/bin/bash\nCP=\$(authselect current | awk 'NR == 1 {print \$3}' | grep custom/)\nfor FN in system-auth password-auth; do\n[[ -n \$CP ]] && PTF=/etc/authselect/\$CP/\$FN || PTF=/etc/authselect/\$FN\n[[ -z \$(grep -E '^\s*password\s+requisite\s+pam_pwquality.so\s+.*enforce_for_root\s*.*$' \$PTF) ]] && sed -ri 's/^\s*(password\s+requisite\s+pam_pwquality.so\s+)(.*)$/\1\2 enforce_for_root/' \$PTF\ndone\nauthselect apply-changes)\n"
		return 1
	fi
}

check_passwd_Enforce
