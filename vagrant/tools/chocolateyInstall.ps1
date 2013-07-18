$url = 'http://files.vagrantup.com/packages/0219bb87725aac28a97c0e924c310cc97831fd9d/Vagrant_1.2.4.msi'
$url64 = $url
$validExitCodes = @(0)
Install-ChocolateyPackage "vagrant" "msi" "/quiet" "$url" "$url64"  -validExitCodes $validExitCodes
