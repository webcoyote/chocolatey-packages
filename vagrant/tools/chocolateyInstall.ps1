try {
  # Vagrant 1.1.4
  $url = 'http://files.vagrantup.com/packages/87613ec9392d4660ffcb1d5755307136c06af08c/Vagrant.msi'
  $packageName = 'vagrant'
  $installerType = 'msi'
  $url64 = $url
  $silentArgs = '/quiet'
  $validExitCodes = @(0)

  # Configure install location
  if ($env:chocolatey_bin_root -ne $null) {
    # Set installation directory to user-configured bin directory
    $installDir = join-path $env:systemdrive $env:chocolatey_bin_root
  }
  else {
    # Set installation directory to C:\Bin
    $installDir = join-path $env:systemdrive "\bin"
  }
  $env:chocolateyInstallArguments = " INSTALLDIR=`"" + $installDir + "`" "

  # Run MSI installer
  Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes

  Write-ChocolateySuccess '__NAME__'
}
catch {
  Write-ChocolateyFailure '__NAME__' $($_.Exception.Message)
  throw 
}
