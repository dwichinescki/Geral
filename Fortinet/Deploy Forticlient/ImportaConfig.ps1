$directory =  "C:\Program Files\Fortinet\FortiClient\"
#& 'C:\Program Files\Fortinet\FortiClient\Forticlient.exe'
& "$directory\fcconfig.exe" -m vpn -f "c:\Users\luizfmm\downloads\FCBackup.xml" -o import
Pause
