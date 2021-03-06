#! /bin/bash

echo config vpn certificate ca
sleep 1
echo edit "JM-ROOTCA-CA"
sleep 1
echo set ca '"-----BEGIN CERTIFICATE-----
MIIFCTCCAvGgAwIBAgIQFtau758mI4hO1jJ9FV/EQzANBgkqhkiG9w0BAQsFADAX
MRUwEwYDVQQDEwxKTS1ST09UQ0EtQ0EwHhcNMTgwNzA0MTQ1MzI0WhcNNDMwNzA0
MTUwMzIwWjAXMRUwEwYDVQQDEwxKTS1ST09UQ0EtQ0EwggIiMA0GCSqGSIb3DQEB
AQUAA4ICDwAwggIKAoICAQChcj3H7Wk8Bvrp16wiXKTw4urAkXH4Sirzt5DZebzU
Rp3PxesaftuNw25miXPKSap8UuXcLu/2LzGp7Vzio7LV4R9o3RhyCzN0xdXSj7Po
nB8vJfXwc4skIuZjf8YhAIFj4qVI48yZFgkHD3EgoyOa8sYYpdqBuGDfF+xtHWwj
YyD18eInbqvwLeO3eSCoFbuxwuLUW73TC2YonjhTxDAZqliVGiboM42zPTh+vPRP
0WM9GTRCvenFO1mIp787AQXZlcEk7SLo+ks5p0PoVUHUxD7mKiM4/HDH40X7CG5A
7JisJ7Ups94xk1C2iUKKRxHlpdUO0EAwwDhs+0zBVx/dMnVPGt7PwP86OpUK7+Wu
deOh6Z8waD1ETryyU3pRd5QCXunqsXP5Vz+YtwpzAzgUUPNU15YCaUOJpDWQgAKc
jvhBzr+luJJt1OiKkeZeRwVakj3DXlkz+Gg+7tNI2izTHPqkpoEBOlMlPvB/3nMo
POBNUfKtRSPyKIdmVbMXSy9LdyeTZcTY3vpvT7vZLbVy1vRVsxVTHuTWHfutJuiu
LWi3wTr9XhYgtvGNQfx5t212r0My7f1ik6q89GcbIeNBozt6RoFvYqdTbU/8R+6l
OEvXyTx5S2zXG5Ez6VfcBXd/L5OpEhiiAVzOhCzlUCYHFHKWzXpQLzD6sarebezS
swIDAQABo1EwTzALBgNVHQ8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4E
FgQUuDCs7OdJebW7aza84UMGJUnK4oAwEAYJKwYBBAGCNxUBBAMCAQAwDQYJKoZI
hvcNAQELBQADggIBADkE6L7G0VNCgmVZbnnvD7T5miEjuv5mrpXW+9qZ2WdszSkp
R7HH2mMkOQsYub6lf4UCsWp9sSpZtcgY4AodMmJQREZ0X1qGgkMOjDkRMYuqqZca
vZF4Iv8kgVLT6+8fzHCRCp9UHp4lGP8UD/lDdlsnyjkre/neo7IMaEenP5Xlqgg9
Rq8qwNF/wNIOEuxMHthKq5GI5qYWUIazGshB9FHOIg7bnTD2E+rIXRVNJXgTXluf
alfy4HmnScYDPdAP1L3UUPTnmYPl9k9jL2fxwHDXCP7PurHmYnvAcVY6QlTO3Qrr
KJgBuelEnTBKgQ+bANWD1PAspeq/jnJdPqZc1namT2M+f8j3pdnwQkejRVW2FM8S
KLDXW2IYMD1lgAg2eUeOMVmoby99QWqNdsz1/vPOn163XPeCIGYWBdMLjqmCcD8s
J6C74YcCH83DjmnusriEGgZ3LOJNn0awm+z+DI9lkaZ6ZXwzd/KOWdd213ZuQlDc
++WBdMxFSeYIuMhwMHNvifY1BonO7Tz3ab/8c9vItV2B5+ayN+nCKlwq7tgA6Kq3
TylZViphr39DohaALkg3yzSRFgKyxlG/4+0ACPPm6EtkAgrVOl9uCMr9wD4CXz2J
S7NbptZIIktWaObmrqMqYyimEpE6htgoeqjpQQLDZDB5n9TBJMA3utiLIOWG
-----END CERTIFICATE-----"'
sleep 1
echo next
sleep 1
echo edit "PRB-CASUB1-CA"
sleep 1
echo set ca '"-----BEGIN CERTIFICATE-----
MIIGrjCCBJagAwIBAgITZwAAAAJU+baeWEQq7wAAAAAAAjANBgkqhkiG9w0BAQsF
ADAXMRUwEwYDVQQDEwxKTS1ST09UQ0EtQ0EwHhcNMTgwNzA0MTc1NjI1WhcNMjgw
NzA0MTgwNjI1WjBJMRIwEAYKCZImiZPyLGQBGRYCam0xGzAZBgoJkiaJk/IsZAEZ
FgtQYXJhbmFCYW5jbzEWMBQGA1UEAxMNUFJCLUNBU1VCMS1DQTCCAiIwDQYJKoZI
hvcNAQEBBQADggIPADCCAgoCggIBAJL0Y8Ejd0A1Udf5Qzp/8zdEQXnO/rfJvIqG
ECFLgKWwWt87eblBT/N8WxcaAVYkTyOE3O1WPLR+vttNdgPE+IqM+AJV1cUsU5ih
XolkmYqPHLHGFf9WYPsaCRKcnixITPouvVoYKKjyNS8U5HvLPq9+qqMjMnDXPqnj
PqpSeUod0dXCEVjpLtCDauOQUvCjUEJy8S71bcHoMccV2YuHN6OPZK1ysq7FBIeY
lA3HFfZ9emqHNlRZOdaFzYim572lZr1965KBWxLNrdDOZctnLHlKzkAGdfCmm4N+
FtVbaAw3IfZuBh8+EAgY026j91PZRqQIJDySL2YRvaxgZzbcOol2UXK7THRjGh17
9yMhoxegzWUVb2nP3duav15nYc8k1pOytU2JWjA6+EFLiGAlHKJvLVzt6dvTdWBS
gB3s+69w0bT8MAD5gf/4q5HDaG5X2KtpzhsymML40r1XHIZbdFINeNcDWhU8aDbH
g54uvWqbLsx7Bhtbl5iCBpdU5FFHtGAyuYOFzpk5OdhAOm4gf2j/NqF+qR7cPVY6
X2IIadPwXkdtQ5JWe7OvUFUZm2eTL4fDFdIrBSDFODY4dwOtWXNP+2NJDIxGfuK1
ahNFZwUwNtIe4FkccQzyFq9By/L+wl1pgksSVex2BnFw8kv48Mgv9QMLNgn9MGZA
AiuoELD3AgMBAAGjggG/MIIBuzAQBgkrBgEEAYI3FQEEAwIBADAdBgNVHQ4EFgQU
BxWWxygWHcIae1t9mfp0DZ1momEwGQYJKwYBBAGCNxQCBAweCgBTAHUAYgBDAEEw
CwYDVR0PBAQDAgGGMA8GA1UdEwEB/wQFMAMBAf8wHwYDVR0jBBgwFoAUuDCs7OdJ
ebW7aza84UMGJUnK4oAwfAYDVR0fBHUwczBxoG+gbYY1aHR0cDovL3BraS5wYXJh
bmFiYW5jby5qbS9DZXJ0RW5yb2xsL0pNLVJPT1RDQS1DQS5jcmyGNGh0dHA6Ly9w
a2kuc2VndXJhZG9yYS5qbS9DZXJ0RW5yb2xsL0pNLVJPT1RDQS1DQS5jcmwwga8G
CCsGAQUFBwEBBIGiMIGfME4GCCsGAQUFBzAChkJodHRwOi8vcGtpLnBhcmFuYWJh
bmNvLmptL0NlcnRFbnJvbGwvVFBSQjIwQ0FST09UX0pNLVJPT1RDQS1DQS5jcnQw
TQYIKwYBBQUHMAKGQWh0dHA6Ly9wa2kuc2VndXJhZG9yYS5qbS9DZXJ0RW5yb2xs
L1RQUkIyMENBUk9PVF9KTS1ST09UQ0EtQ0EuY3J0MA0GCSqGSIb3DQEBCwUAA4IC
AQCBR9jo9AIq2k1kxUPsKVVGUTTLHeKm8H31xYN3HtzgFvpoPpuwgT1NnGLjpju0
RJi69xRmP0JQ08QWMpEKvN/8AEEH/QtQBxkJevnuoGd42iiWTCTQwFxJROtOOvoc
ssuNcS1VmyZE5V5M2VZogrkeKndMFU/2PTT21wt2DbiiTamNyJmO7Uux4t86UHPu
WppfhSqaQMjuZyfhu0E3IJ1R8ihfrit/ObvvTyzqedCrcPopRm5cLhda+8UXU+3+
O5FrxdZljjrT4acskYu8CuAJFfdt2ccHBzUusgrzxV7sfEjfP+XGL29sFnEdt94V
UEb1Bv2to7HIyRINESPv5N/nZawT+7jp36yCOL8kk1dICzTwd6bH+Wwtv9pfaZdN
5afbF09ymUmwlEjfLZhfhf4VsXM09lfUKBF2uwxbPQ4z1qGqC/JtawvhKXROpE3R
YuZeG0KhtzxXprJaWvNuAfsitAtIwAoYtWOwaMnnJalW4O+9ldgBG6MOUNCNJ0sv
C97/SB/ALGiOl1GKkk+OM8lN2EIxhrPztvQ8WCYu1hZq+1QwkN5ld9hF1wo7RErN
pltUFlStpRGm3nrrSs3ZC+/G00EkCUQ6RP1nz+/bCcE7f1YE2K45voi15Bmi8wgM
OQLFMkQO6zHBIzKkpab/sVTpsl6Wsmq/T6Ghk0prspIVQw==
-----END CERTIFICATE-----"'
sleep 1
echo next
sleep 1
echo end
sleep 1
echo quit