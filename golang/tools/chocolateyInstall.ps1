$packageName = 'golang'
$url = 'https://go.googlecode.com/files/go1.2.1.windows-amd64.msi'
$url64 = $url
$validExitCodes = @(0)

try {
  Install-ChocolateyPackage "$packageName" "msi" "/quiet" "$url" "$url64" -validExitCodes $validExitCodes
  Write-ChocolateySuccess "$packageName"
}
catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw
}
