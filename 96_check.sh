#!/bin/bash

check_snmpd(){
	x=$(systemctl list-units | grep snmpd.service)

	if [[ -z $x ]];
	then echo "snmpd has been disabled.(GCB 96 設置完成)"
		return 0
	else
		echo "snmpd is not disabled.(停用SNMP服務，開啟終端機，執行以下指令停用SNMP服務：systemctl --now disable snmpd)"
		return 1
	fi
}

check_snmpd
