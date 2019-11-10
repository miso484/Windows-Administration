# Create Self Signed SSL Certificate.
# Self Signed SSL Certificate is for the purpose of development or testing, if you use your server as a business, it had better buy and use a Formal Certificates.

# make sure certificates stored PATH
Get-PSDrive | Format-Table -AutoSize -Wrap

# create self signed certificate
# -DnsName (DNS name)
# -KeyAlgorithm (RSA | ECDSA)
# -KeyLength (Key Length)
# -CertStoreLocation (certificate store PATH)
# -NotAfter (valid term : the example below is 10 years)
New-SelfSignedCertificate `
-DnsName "rx-7.srv.world" `
-KeyAlgorithm RSA `
-KeyLength 2048 `
-CertStoreLocation "Cert:\LocalMachine\My" `
-NotAfter (Get-Date).AddYears(10)