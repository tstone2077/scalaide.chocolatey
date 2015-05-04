#Import-Module Join-Path "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" "GenerateBinFile"
$packageName = 'scalaide'
$url = 'http://downloads.typesafe.com/scalaide-pack/4.0.0.vfinal-luna-211-20150305/scala-SDK-4.0.0-vfinal-2.11-win32.win32.x86.zip'
$url64 = 'http://downloads.typesafe.com/scalaide-pack/4.0.0.vfinal-luna-211-20150305/scala-SDK-4.0.0-vfinal-2.11-win32.win32.x86_64.zip'

# download and unpack a zip file
# if removing $url64, please remove from here
Install-ChocolateyZipPackage "$packageName" "$url" "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" "$url64"

#Create ignore files so the batch files are not automatically generated
$exeLocation = Join-Path "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" "eclipse"
$src = Join-Path $exeLocation "eclipse.exe"
$dest = Join-Path $exeLocation "eclipse.exe.ignore"
Copy-Item -path $src -destination $dest
#Create a batch file with a different name than the exe geing generated
Generate-BinFile $packageName $src -useStart
$src = Join-Path $exeLocation "eclipsec.exe"
$dest = Join-Path $exeLocation "eclipsec.exe.ignore"
Copy-Item -path $src -destination $dest
#Create a batch file with a different name than the exe geing generated
Generate-BinFile "$($packageName)c" $src -useStart
