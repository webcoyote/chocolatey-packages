$name = 'cwRsync_4.0.5_Installer'
$url = "https://www.itefix.no/i2/sites/default/files/$($name).zip"

# AppendPath ";a;b;;c;" ";d;"    => a;b;c;d
function AppendPath ([String]$path, [String]$dir) {
  $result = $path.split(';') + $dir.split(';') |
      where { $_ -ne '' } |
      select -uniq
  [String]::join(';', $result)
}

# Add to the global environment; $target => { 'Machine', User' }
function AddGlobalPath ([String]$dir, [String]$target) {
  $path = [Environment]::GetEnvironmentVariable('Path', $target)
  $path = AppendPath $path $dir
  [Environment]::SetEnvironmentVariable('Path', $path, $target)
}

try {
  # Create the temporary download directory
  $chocTempDir = Join-Path $env:TEMP "chocolatey"
  $tempDir = Join-Path $chocTempDir "cwrsync"
  if (![System.IO.Directory]::Exists($tempDir)) {
    [System.IO.Directory]::CreateDirectory($tempDir)
  }

  # Download and unpack the zip file
  $zipFile = Join-Path $tempDir "$($name).zip"
  Get-ChocolateyWebFile cwrsync $zipFile $url $url

  # Inside the zip file is an exe file; extract that
  $exeFile = Join-Path $tempDir "$($name).exe"
  if ([System.IO.File]::Exists($exeFile)) {
    Remove-Item "$exeFile"
  }
  Get-ChocolateyUnzip "$zipFile" $tempDir "" cwrsync

  # The EXE file doesn't have a silent install mode. Fortunately
  # it is actually a self-extracting archive which we can extract
  # with 7zip
  $dst = join-path $env:systemdrive $env:chocolatey_bin_root
  $dst = join-path $dst "cwrsync"
  $cmd = "7z.exe"
  $params = "x", "-y", "-o$($dst)", $exeFile
  & $cmd $params

  # Add go bin directory to the path
  $binDir = join-path $dst "bin"
  AddGlobalPath $binDir "User"

  Write-ChocolateySuccess cwrsync
}
catch {
  Write-ChocolateyFailure cwrsync $($_.Exception.Message)
  throw
}
