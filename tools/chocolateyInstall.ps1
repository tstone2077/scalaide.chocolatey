$packageName = 'scalaide'
$url = 'http://downloads.typesafe.com/scalaide-pack/3.0.2.vfinal-210-20131028/scala-SDK-3.0.2-vfinal-2.10-win32.win32.x86.zip'
$url64 = 'http://downloads.typesafe.com/scalaide-pack/3.0.2.vfinal-210-20131028/scala-SDK-3.0.2-vfinal-2.10-win32.win32.x86_64.zip'

# download and unpack a zip file
# if removing $url64, please remove from here
Install-ChocolateyZipPackage "$packageName" "$url" "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" "$url64"

#move the exes so they don't collide with eclipse
$exeLocation = Join-Path "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" "eclipse"
$src = Join-Path $exeLocation "eclipse.exe"
$dest = Join-Path $exeLocation "$packageName.exe"
Move-Item -path $src -destination $dest
$src = Join-Path $exeLocation "eclipsec.exe"
$dest = Join-Path $exeLocation "$($packageName)c.exe"
Move-Item -path $src -destination $dest
