#! /bin/bash

echo config system email-server
sleep 1
echo unset authenticate
sleep 1
echo unset username
sleep 1
echo unset password
sleep 1
echo set reply-to fortinet@pbtech.net.br
sleep 1
echo set server 10.102.1.128
sleep 1
echo end
sleep 1
echo config alertemail setting
sleep 1
echo set username fortinet@pbtech.net.br
sleep 1
echo set mailto1 ti.infra.prb@pbtech.net.br
sleep 1
echo set FDS-license-expiring-warning enable
sleep 1
echo set FDS-license-expiring-days 30
sleep 1
echo end
sleep 1
echo diagnose log alertmail test
sleep 1
echo quit
sleep 1
