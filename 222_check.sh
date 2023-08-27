#!/bin/bash

check_remember(){
	if grep -q "remember=3" "/etc/authselect/system-auth";
	then echo "User most recent password remember is 3.(GCB 222 設置完成)"
		return 0
	else
		printf "User most recent password remember not 3(開啟終端機，執行以下腳本，新增或修改設定為「remember=3」，更新system-auth檔案：\n#!/bin/bash\nCP=\$(authselect current | awk 'NR == 1 {print \$3}' | grep custom/)\n[[ -n \$CP ]] && PTF=/etc/authselect/\$CP/system-auth || PTF=/etc/authselect/system-auth\n[[ -n \$(grep -E '^\s*password\s+(sufficient\s+pam_unix|requi(red|site)\s+pam_pwhistory).so\s+([^#]+\s+)*remember=\S+\s*.*$' \$PTF) ]] && sed -ri 's/^\s*(password\s+(requisite|sufficient)\s+(pam_pwquality\.so|pam_unix\.so)\s+)(.*)(remember=\S+\s*)(.*)$/\1\4 remember=3 \6/' \$PTF || sed -ri 's/^\s*(password\s+(requisite|sufficient)\s+(pam_pwquality\.so|pam_unix\.so)\s+)(.*)$/\1\4 remember=3/' \$PTF\nauthselect apply-changes)\n"
		return 1
	fi
}

check_remember
