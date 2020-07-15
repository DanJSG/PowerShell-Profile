Function Stop-ProcessOnPort($Port) {
	try {
		$id = (Get-Process -Id (Get-NetTCPConnection -LocalPort $Port).OwningProcess)."Id";
		Stop-Process -Id $id;
		Write-Host "Successfully stopped process $id running on port ${Port}.";
	} catch {
		Write-Error "Failed to find a process running on port ${Port}.";
	}
}

Write-Output "Global profile.ps1 script running from $PsHome.`n";
Set-Location D:\Documents\GitHub\
