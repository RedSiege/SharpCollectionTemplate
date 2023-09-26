#Get all binary artifacts
#Make sure you go to Agent Job -> Scroll down and check "Allow scripts to access the OAuth token"
$binaryPaths = Get-ChildItem -Path "D:\a\r1\a\_SharpCollection.*" -Filter *.exe -r

#Move into git repo
cd "D:/a/r1/a/_YourAzureDevOpsOrg_SharpCollection\"

#Prep config
git config --global user.email "youremail@domain.tld"
git config --global user.name "Azure Dev Ops Pipeline"
git checkout main

foreach ($binary in $binaryPaths ) {

	if ($binary -like '*net_4.0_32*') {
		$artifactName = (Split-Path -Path $binary -Leaf).Replace("net_4.0_32","").Split(".")[0]+ ".exe"
		Copy-Item $binary -Destination "D:\a\r1\a\_YourAzureDevOpsOrg_SharpCollection\NetFramework_4.0_x86\$artifactName"
		Write-Host "Moving $binary to D:\a\r1\a\_YourAzureDevOpsOrg_SharpCollection\NetFramework_4.0_x86\$artifactName"
    }

	if ($binary -like '*net_4.0_64*') {
		$artifactName = (Split-Path -Path $binary -Leaf).Replace("net_4.0_64","").Split(".")[0]+ ".exe"
		Copy-Item $binary -Destination "D:\a\r1\a\_YourAzureDevOpsOrg_SharpCollection\NetFramework_4.0_x64\$artifactName"
		Write-Host "Moving $binary to D:\a\r1\a\_YourAzureDevOpsOrg_SharpCollection\NetFramework_4.0_x64\$artifactName"
     }

	if ($binary -like '*net_4.0_Any*') {
		$artifactName = (Split-Path -Path $binary -Leaf).Replace("net_4.0_Any","").Split(".")[0]+ ".exe"
		Copy-Item $binary -Destination "D:\a\r1\a\_YourAzureDevOpsOrg_SharpCollection\NetFramework_4.0_Any\$artifactName"
		Write-Host "Moving $binary to D:\a\r1\a\_YourAzureDevOpsOrg_SharpCollection\NetFramework_4.0_Any\$artifactName"
	}

    if ($binary -like '*net_4.5_32*') {
		$artifactName = (Split-Path -Path $binary -Leaf).Replace("net_4.5_32","").Split(".")[0]+ ".exe"
		Copy-Item $binary -Destination "D:\a\r1\a\_YourAzureDevOpsOrg_SharpCollection\NetFramework_4.5_x86\$artifactName"
		Write-Host "Moving $binary to D:\a\r1\a\_YourAzureDevOpsOrg_SharpCollection\NetFramework_4.5_x86\$artifactName"
    }

	if ($binary -like '*net_4.5_64*') {
		$artifactName = (Split-Path -Path $binary -Leaf).Replace("net_4.5_64","").Split(".")[0]+ ".exe"
		Copy-Item $binary -Destination "D:\a\r1\a\_YourAzureDevOpsOrg_SharpCollection\NetFramework_4.5_x64\$artifactName"
		Write-Host "Moving $binary to D:\a\r1\a\_YourAzureDevOpsOrg_SharpCollection\NetFramework_4.5_x64\$artifactName"
    }

	if ($binary -like '*net_4.5_Any*') {
		$artifactName = (Split-Path -Path $binary -Leaf).Replace("net_4.5_Any","").Split(".")[0]+ ".exe"
		Copy-Item $binary -Destination "D:\a\r1\a\_YourAzureDevOpsOrg_SharpCollection\NetFramework_4.5_Any\$artifactName"
		Write-Host "Moving $binary to D:\a\r1\a\_YourAzureDevOpsOrg_SharpCollection\NetFramework_4.5_Any\$artifactName"
	}
	
	if ($binary -like '*net_4.7_64*') {
		$artifactName = (Split-Path -Path $binary -Leaf).Replace("net_4.7_64","").Split(".")[0]+ ".exe"
		Copy-Item $binary -Destination "D:\a\r1\a\_YourAzureDevOpsOrg_SharpCollection\NetFramework_4.7_x64\$artifactName"
		Write-Host "Moving $binary to D:\a\r1\a\_YourAzureDevOpsOrg_SharpCollection\NetFramework_4.7_x64\$artifactName"
    }

	if ($binary -like '*net_4.7_32*') {
		$artifactName = (Split-Path -Path $binary -Leaf).Replace("net_4.7_32","").Split(".")[0]+ ".exe"
		Copy-Item $binary -Destination "D:\a\r1\a\_YourAzureDevOpsOrg_SharpCollection\NetFramework_4.7_x86\$artifactName"
		Write-Host "Moving $binary to D:\a\r1\a\_YourAzureDevOpsOrg_SharpCollection\NetFramework_4.7_x86\$artifactName"
	}

	if ($binary -like '*net_4.7_Any*') {
		$artifactName = (Split-Path -Path $binary -Leaf).Replace("net_4.7_Any","").Split(".")[0]+ ".exe"
		Copy-Item $binary -Destination "D:\a\r1\a\_YourAzureDevOpsOrg_SharpCollection\NetFramework_4.7_Any\$artifactName"
		Write-Host "Moving $binary to D:\a\r1\a\_YourAzureDevOpsOrg_SharpCollection\NetFramework_4.7_Any\$artifactName"
	}

	cd "D:\a\r1\a\_YourAzureDevOpsOrg_SharpCollection\"
	git add .
	git commit -m "Added latest release of $artifactName"
	git push origin main 
}

$gitPaths = Get-ChildItem -Path "D:\a\r1\a\" -Recurse
foreach ($gitBinary in $gitPaths ) {
	Write-Host $gitBinary.FullName
}
