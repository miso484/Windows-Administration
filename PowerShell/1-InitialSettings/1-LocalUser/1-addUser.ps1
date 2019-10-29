# add [miso.stamenic] user
# [P@ssw0rd01] ⇒ the password you set (replace it you like)
# [PasswordNeverExpires] ⇒ set password never expire(if set default expiration, do not specify this option)
New-LocalUser -Name "miso.stamenic" `
-FullName "Miso Stamenic" `
-Description "Administrator of this Computer" `
-Password (ConvertTo-SecureString -AsPlainText "P@ssw0rd01" -Force) `
-PasswordNeverExpires `
-AccountNeverExpires 
