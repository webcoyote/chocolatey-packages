$currentDir = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition
$env:Path =  "$currentDir\\3.1.0;" + $env:Path
& "$currentDir\3.1.0\rsync.exe" $args