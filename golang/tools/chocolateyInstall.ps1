# Go [64 bit] [windows] [version 1.1.1]
$url = 'http://go.googlecode.com/files/go1.1.1.windows-amd64.zip'

# Configure install location
$dst = join-path $env:systemdrive $env:chocolatey_bin_root

# Install it
Install-ChocolateyZipPackage 'golang' $url $dst

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

# Configure go environment variables
$go_root_dir = join-path $dst "go"
[Environment]::SetEnvironmentVariable('GOROOT', $go_root_dir, "User")

# Add go bin directory to the path
$go_bin_dir  = join-path $go_root_dir "bin"
AddGlobalPath $go_bin_dir "User"
