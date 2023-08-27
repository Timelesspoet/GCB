#!/bin/bash

check_ENCRYPT_METHOD(){
	if grep -q "^ENCRYPT_METHOD SHA512" "/etc/login.defs";
	then echo "Encrypt method is SHA512.(GCB 224 設置完成)"
		return 0
	else
		printf "Encrypt method not SHA512.(編輯/etc/login.defs檔案，新增或修改成以下內容：ENCRYPT_METHOD SHA512\n開啟終端機，執行以下腳本，新增或修改設定為「sha512」，更新system-auth與password-auth檔案：\n#!/bin/bash\nCP=\$(authselect current | awk 'NR == 1 {print \$3}' | grep custom/)\nfor FN in system-auth password-auth; do\n[[ -n \$CP ]] && PTF=/etc/authselect/\$CP/\$FN || PTF=/etc/authselect/\$FN\n[[ -z \$(grep -E '^\s*password\s+sufficient\s+pam_unix.so\s+.*sha512\s*.*$' \$PTF) ]] && sed -ri 's/^\s*(password\s+sufficient\s+pam_unix.so\s+)(.*)$/\1\2 sha512/' \$PTF\ndone\nauthselect apply-changes)\n"
		return 1
	fi
}

check_ENCRYPT_METHOD
