$packageName = 'cwrsync'
$url = 'https://www.itefix.no/i2/sites/all/modules/pubdlcnt/pubdlcnt.php?file=https://www.itefix.no/download/cwRsync_5.2.2_Free.zip'

try {
  $installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  Install-ChocolateyZipPackage "$packageName" "$url" "$installDir"
  Write-ChocolateySuccess "$packageName"
}
catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw
}
