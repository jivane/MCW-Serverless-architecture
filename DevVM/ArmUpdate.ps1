New-Item "c:\jdchoco" -type Directory -force | Out-Null
$LogFile = "c:\jdchoco\JDScript.log"
$chocoPackages | Out-File $LogFile -Append

$chocoPackages = "7zip.install,azure-cli,azurepowershell,microsoftazurestorageexplorer,beyondcompare,chocolateygui,composer,curl,docker-for-windows,docker-kitematic,dotnet4.7,git.install,mysql,mysql.workbench,nodejs.install,powershell,sysinternals,visualstudiocode,wget,winscp"

# Create pwd and new $creds for remoting
$username = "workshopMCW"
$password = "1PasswordWorkshop1"
$secpassword = ConvertTo-SecureString $password -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential("$env:COMPUTERNAME\$($username)", $secPassword)


#"Changing ExecutionPolicy" | Out-File $LogFile -Append
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force

# Install Choco
#"Installing Chocolatey" | Out-File $LogFile -Append
$sb = { iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')) }
Invoke-Command -ScriptBlock $sb -ComputerName $env:COMPUTERNAME -Credential $credential | Out-Null

#"Disabling UAC" | Out-File $LogFile -Append
$sb = { Set-ItemProperty -path HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System -name EnableLua -value 0 }
Invoke-Command -ScriptBlock $sb -ComputerName $env:COMPUTERNAME -Credential $credential 

#Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux


#"Install each Chocolatey Package"
$chocoPackages.Split(",") | ForEach {
    $command = "cinst " + $_ + " -y -force"
    $command | Out-File $LogFile -Append
    $sb = [scriptblock]::Create("$command")

    # Use the current user profile
    Invoke-Command -ScriptBlock $sb -ArgumentList $chocoPackages -ComputerName $env:COMPUTERNAME -Credential $credential | Out-Null
}

