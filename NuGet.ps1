function Step-oobeExecutionPolicy {
    [CmdletBinding()]
    param ()
    if ($env:UserName -eq 'defaultuser0') {
        if ((Get-ExecutionPolicy) -ne 'RemoteSigned') {
            Write-Host -ForegroundColor Cyan 'Set-ExecutionPolicy RemoteSigned'
            Set-ExecutionPolicy RemoteSigned -Force
        }
    }
}

function Step-oobePackageManagement {
    [CmdletBinding()]
    param ()
            Write-Host -ForegroundColor Cyan 'Install-Package PackageManagement,PowerShellGet'
            Install-Package -Name NuGet -MinimumVersion 2.8.5.201 -Force -Confirm:$false -Source PSGallery | Out-Null
    
            Write-Host -ForegroundColor Cyan 'Import-Module NuGet'
            Import-Module PackageManagement,PowerShellGet -Force
    }


Step-oobeExecutionPolicy
Step-oobePackageManagement
