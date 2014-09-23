$packageName = 'golang'
$installerType = 'msi'
$url = 'https://storage.googleapis.com/golang/go1.3.1.windows-386.msi'
$url64 = 'https://storage.googleapis.com/golang/go1.3.1.windows-amd64.msi'
$validExitCodes = @(0)

try {
  Install-ChocolateyPackage "$packageName" "$installerType" "/quiet" "$url" "$url64" -validExitCodes $validExitCodes
  Write-ChocolateySuccess "$packageName"
}
catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw
}
