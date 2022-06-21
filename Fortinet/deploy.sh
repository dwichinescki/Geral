#!/bin/bash

echo -n Usuario:\ 
read usuario
echo -n Senha:\ 
read -s senha
echo

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
10.41.201.1
10.62.0.1
10.11.2.1
10.42.0.1
10.41.193.1
10.47.0.1
10.43.0.1
10.43.1.1
10.43.3.1
10.11.5.1
10.41.192.1
10.44.0.1
10.44.1.1
10.41.195.1
10.44.2.1
10.71.1.1
10.12.0.1
10.41.198.1
10.13.0.1
10.11.0.1
10.31.1.1
10.11.4.1
10.11.6.1
10.11.3.1
')

for firewall in $firewalls
	do
	
		echo "Executando em $firewall"
		./$1 | sshpass -p $senha ssh -t -t -o StrictHostKeyChecking=no $usuario@$firewall
		
	done
