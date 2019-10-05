#Se especifica el nombre de dominio
$domain = "mawell.com"

#Se especifica la contraseña de la cuenta con la que se unirá la VM al dominio
$password = "Enblanc0ps" | ConvertTo-SecureString -asPlainText -Force

#Se especifica el nombre de usuario que tiene permisos para unir la VM al dominio
$username = "lalberca@mawellinformesgmailcom.onmicrosoft.com"

#Se crea el objeto de automatización de credenciales y se almacena en la variable "Credential"
$credential = New-Object System.Management.Automation.PSCredential($username,$password)

#Con las variables definidas anteriormente se une la VM al dominio y se reinicia
Add-Computer -DomainName $domain -Credential $credential -Restart -Force