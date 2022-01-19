$packageName 		= 'ClickUp'
[array]$key 		= Get-UninstallRegistryKey -SoftwareName "$packageName*"
$uninstallString 	= $key.UninstallString
$file 				= $uninstallString
$silentArgs 		= $uninstallString.Replace("MsiExec.exe /X", "") + " /qn"
$fileType			= 'msi'
$validExitCodes 	= @(0);

$packageArgs = @{
	packageName    = $packageName
	file           = $file
	silentArgs     = $silentArgs
	fileType       = $fileType
	validExitCodes = $validExitCodes
}

Stop-Process -Name $packageName -ErrorAction SilentlyContinue

Uninstall-ChocolateyPackage @packageArgs