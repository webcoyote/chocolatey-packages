$url = 'http://files.vagrantup.com/packages/b12c7e8814171c1295ef82416ffe51e8a168a244/Vagrant_1.3.1.msi'
$url64 = $url
$validExitCodes = @(0)
Install-ChocolateyPackage "vagrant" "msi" "/quiet" "$url" "$url64"  -validExitCodes $validExitCodes
