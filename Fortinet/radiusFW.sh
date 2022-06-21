#! /bin/bash

echo config user radius
sleep 1
echo edit "Radius-PRB"
sleep 1
echo set server "10.41.60.2"
sleep 1
echo set secret T4vibmavHGydy4PVctEP
sleep 1
echo set nas-ip $1
sleep 1
echo set source-ip $1
sleep 1
echo next
sleep 1
echo end

echo config user group
sleep 1
echo edit "RadiusGroup-PRB"
sleep 1
echo set member "Radius-PRB"
sleep 1
echo next
sleep 1
echo end

echo config system admin
sleep 1
echo edit "luizfmm"
sleep 1
echo set remote-auth enable
sleep 1
echo set trusthost1 10.0.0.0 255.0.0.0
sleep 1
echo set accprofile "super_admin"
sleep 1
echo set vdom "root"
sleep 1
echo set remote-group RadiusGroup-PRB
sleep 1
echo set password 'aCc5%pXgSSw4b:'
sleep 1
echo set vdom "root"
sleep 1
echo next
sleep 1
echo end
sleep 1

echo config system admin
sleep 1
echo edit "augustocr"
sleep 1
echo set remote-auth enable
sleep 1
echo set trusthost1 10.0.0.0 255.0.0.0
sleep 1
echo set accprofile "super_admin"
sleep 1
echo set vdom "root"
sleep 1
echo set remote-group RadiusGroup-PRB
sleep 1
echo set password '&G2F,w8nFw*3MuM'
sleep 1
echo set vdom "root"
sleep 1
echo next
sleep 1
echo end
sleep 1

echo config system admin
sleep 1
echo edit "andredsa"
sleep 1
echo set remote-auth enable
sleep 1
echo set trusthost1 10.0.0.0 255.0.0.0
sleep 1
echo set accprofile "super_admin"
sleep 1
echo set vdom "root"
sleep 1
echo set remote-group RadiusGroup-PRB
sleep 1
echo set password 'vN^8n=6hJF!u;Yhw'
sleep 1
echo set vdom "root"
sleep 1
echo next
sleep 1
echo end
sleep 1
echo quit

