Function Stop-8080-Process {
	try {
		$id = (Get-Process -Id (Get-NetTCPConnection -LocalPort 8080).OwningProcess)."Id";
		Stop-Process -Id $id;
		Write-Host "Successfully stopped process $id running on port 8080.";
	} catch {
		Write-Error "Failed to find a process running on port 8080.";
	}
}

Write-Output "Global profile.ps1 script running from $PsHome.`n";
Set-Location D:\Documents\GitHub\
