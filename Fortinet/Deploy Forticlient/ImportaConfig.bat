echo off
pushd "C:\Program Files\Fortinet\FortiClient\"
start "" Forticlient.exe
fcconfig -m vpn -f "c:\Users\luizfmm\downloads\FCBackup.xml" -o import 