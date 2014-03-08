$packageName = 'cwrsync'
$version = '3.1.0'
$url = 'https://www.itefix.no/i2/sites/all/modules/pubdlcnt/pubdlcnt.php?file=https://www.itefix.no/download/cwRsync_5.2.2_Free.zip'

try {
  $installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

  # Unzip cwrsync zip, but ignore all executables
  Install-ChocolateyZipPackage "$packageName" "$url" "$installDir"
  Set-Content -Path ("$installDir\$version\ssh.exe.ignore") -Value $null
  Set-Content -Path ("$installDir\$version\ssh-keygen.exe.ignore") -Value $null
  Set-Content -Path ("$installDir\$version\rsync.exe.ignore") -Value $null

  # Install a script that add path to rsync executables before launching it
  Install-ChocolateyPowershellCommand "$packageName" "$installDir\rsync.ps1"

  Write-ChocolateySuccess "$packageName"
}
catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw
}
