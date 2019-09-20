#Mail SMTP Setup Section
$Subject = “New Software Has Been Installed on $env:COMPUTERNAME” # Message Subject 
$Server = “smtp.server” # SMTP Server 
$From = “From@domain.com” # From whom we are sending an   e-mail(add anonymous logon permission if needed) 

$To = “to@uncc.edu” # To whom we are sending 
$Pwd = ConvertTo-SecureString “enterpassword” -AsPlainText –Force #Sender account password 
#(Warning! Use a very restricted account for the sender,  because the password stored in the script will be not encrypted) 
$Cred = New-Object  System.Management.Automation.PSCredential(“From@domain.co m” , $Pwd) #Sender account credentials 

$encoding = [System.Text.Encoding]::UTF8 #Setting encoding to UTF8 for message correct display 

#Generates human readable userID from UserSID in log. 
$UserSID = (Get-WinEvent -FilterHashtable @{LogName=”Application”;ID=11707;ProviderName="MsiInstaller"}).UserID.Value | select -First 1
$objSID = New-Object System.Security.Principal.SecurityIdentifier("$UserSID")
$UserID= $objSID.Translate([System.Security.Principal.NTAccount])

#Generates email body containing time created and message of application install.
$Body=Get-WinEvent -FilterHashtable @{LogName=”Application”;ID=11707;ProviderName='MsiInstaller'} | Select TimeCreated,Message | select-object -First 1

#Sending an e-mail. 
Send-MailMessage -From $From -To $To -SmtpServer $Server -Body "$Body . Installed by: $UserID" -Subject $Subject -Credential $Cred -Encoding $encoding