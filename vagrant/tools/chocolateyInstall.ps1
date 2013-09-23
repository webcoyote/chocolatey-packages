$url = 'http://files.vagrantup.com/packages/db8e7a9c79b23264da129f55cf8569167fc22415/Vagrant_1.3.3.msi'
$url64 = $url
$validExitCodes = @(0)
Install-ChocolateyPackage "vagrant" "msi" "/quiet" "$url" "$url64"  -validExitCodes $validExitCodes
