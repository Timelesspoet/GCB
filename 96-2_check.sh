#!/bin/bash

check_snmpv3(){
	if grep -q "^com2sec\|^group\|^view\|^access" "/etc/snmp/snmpd.conf";
	then printf "SNMPv3 not set.(\n開啟終端機，執行以下指令停止SNMP服務：systemctl stop snmpd\n執行以下指令設定SNMPv3並建立SNMPv3使用者，設定為僅允許讀取、身分驗證使用SHA及傳輸加密使用AES：net-snmp-create-v3-user -ro -A (使用者密碼) -a SHA -X (傳輸加密用密碼) -x AES (使用者名稱)\n執行以下指令編輯/etc/snmp/snmpd.conf檔案：vim /etc/snmp/snmpd.conf\n將包含com2sec、group、view及access參數之行內容註解(新增#符號於行首)，以停用SNMPv1與SNMPv2，範例如下：\n#com2sec notConfigUser  default       public\n#group   notConfigGroup v1           notConfigUser\n#group   notConfigGroup v2c          notConfigUser\n#view    systemview    included   .1.3.6.1.2.1.1\n#view    systemview    included   .1.3.6.1.2.1.25.1.1\n#access  notConfigGroup  ""      any       noauth    exact  systemview none none\n執行以下指令重新啟動SNMP服務，令設定生效僅啟用SNMPv3：\nsystemctl start snmpd)\n"
		return 0
	else
		echo "SNMPv3 is set.(GCB 96 SNMPv3設置完成)"
		return 1
	fi
}

check_snmpv3
