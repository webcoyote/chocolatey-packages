$url = 'http://files.vagrantup.com/packages/0ac2a87388419b989c3c0d0318cc97df3b0ed27d/Vagrant_1.3.4.msi'
$url64 = $url
$validExitCodes = @(0)
Install-ChocolateyPackage "vagrant" "msi" "/quiet" "$url" "$url64"  -validExitCodes $validExitCodes
