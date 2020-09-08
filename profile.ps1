Function Stop-ProcessOnPort($Port) {
	try {
		$id = (Get-Process -Id (Get-NetTCPConnection -LocalPort $Port).OwningProcess)."Id";
		Stop-Process -Id $id;
		Write-Host "Successfully stopped process $id running on port ${Port}.";
	} catch {
		Write-Error "Failed to find a process running on port ${Port}.";
	}
}

Function New-Password($Length) {
	if($Length -lt 1) {
		Write-Error "Length must be a positive integer.";
		return;
	}
	$pwd = "";
	$alpha = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!&*@#?%";
	for($i = 0; $i -lt $Length; $i++) {
		$pwd += $alpha[(Get-Random) % ($alpha.Length + 1)];
	}
	return $pwd;
}

# Modify the line below to set your default terminal directory.
# Set-Location E:\GitHub\

# Modify the line below to enable Git for Powershell.
# Import-Module posh-git

Write-Output "Global profile.ps1 script running from $PsHome.`n";
