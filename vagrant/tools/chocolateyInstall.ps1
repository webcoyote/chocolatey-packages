$url = 'https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.1.msi'
$url64 = $url
$validExitCodes = @(0)
Install-ChocolateyPackage "vagrant" "msi" "/quiet" "$url" "$url64"  -validExitCodes $validExitCodes
