$user="workshopMCW"
$password="MyOnePass:123"
$tenantId ="6e92a5ab-8e47-4d8c-a98c-0f74fc9b8dd7"
$number=30
# Install-Module AzureAD
$Credential = Get-Credential
$tenant = Connect-AzureAD -Credential $Credential -TenantId $tenantId


for($cpt=2;$cpt -le $number;$cpt++)
{
    $PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
    $PasswordProfile.Password = $password
    $PasswordProfile.EnforceChangePasswordPolicy=0
    $PasswordProfile.ForceChangePasswordNextLogin=0
    $address = $user+$cpt+"@"+$tenant.TenantDomain
    try {
        New-AzureADUser -AccountEnabled $True -DisplayName $user -PasswordProfile $PasswordProfile -MailNickName $user -UserPrincipalName $address
    }
    catch {
        
    }

}

#remove user
$users = Get-AzureADUser|Where-Object {$_.UserPrincipalName -match '^workshopmcw.*'} 
for($cpt=0;$cpt -le $users.Count;$cpt++) { Remove-AzureADUser -ObjectId $users[$cpt].ObjectId}