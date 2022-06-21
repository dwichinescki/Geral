#!/bin/bash

# Luiz Fernando - 14/03/2022

firewalls=('
10.41.197.1
10.31.0.1
10.41.230.1
10.45.1.1
10.41.200.1
10.19.0.1
10.41.196.1
10.44.3.1
10.41.194.1
10.45.0.1
10.48.0.1
10.62.0.1
10.11.2.1
10.43.0.1
10.41.192.1
10.44.0.1
10.71.1.1
10.12.0.1
10.41.198.1
10.13.0.1
10.11.0.1
10.11.4.1
10.11.6.1
10.41.13.240
10.41.13.241
10.41.13.242
10.41.13.243
')

for firewall in $firewalls
	do
	
		echo -e "\e[1;31m Executando em $firewall \e[0m"
		snmpwalk -v 2c -m +./fortigate.mib -c 89kjkljasdlkj $firewall fgLicContractTable
		
	done
