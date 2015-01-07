$packageName = 'golang'
$url = 'https://storage.googleapis.com/golang/go1.3.windows-amd64.msi'
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
