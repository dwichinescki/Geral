#!/bin/bash

# Luiz Fernando - 24/03/2022 - Elaboracao do script

# Script para monitoramento do status dos pods - Este monitoramento pode ser aprimorado para funcionar atrav�s de API.


# Monitora status. Informar o que deseja monitorar, o namespace e então o nome do pod.

# Para status.
if [[ $1 == 'status' ]] ; then
  oc get pods -n $2 $3 -o json | jq '.status .phase' | sed 's/"//g'

# Para idade. Retorna em segundos a partir do valor de startDate.
elif [[ $1 == 'age' ]] ; then
  startTime=`oc get pods -n $2 $3 -o json | jq '.status .startTime' | sed 's/"//g'`
  echo $(( ($(date +%s) - $(date --date=$startTime +%s))))

# Se nao informa parametro, faz discovery e gera o JSON utilizado pelo Zabbix
else
  output=`oc get pods --all-namespaces -o json`
  namespaces=`echo $output | jq '.items[] .metadata .namespace' | sed 's/"//g'`
  pods=`echo $output | jq '.items[] .metadata .name' | sed 's/"//g'`
  count=`echo "${pods}" | wc -l`

  echo '{'
      echo '"data":['
      for i in `/usr/bin/seq 1 $count`; do
          pod=`echo "${pods}" | sed "${i}!d"`
          namespace=`echo "${namespaces}" | sed "${i}!d"`
          line='{"{#NAMESPACE}":"'${namespace}'","{#PODNAME}":"'${pod}'"}'
          printf "$line"

          if [ $i -ne $count ]; then
              echo ','
          fi
      done
      echo
      echo ']'
      echo '}'
fi