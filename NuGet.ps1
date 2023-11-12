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
    if ($env:UserName -eq 'defaultuser0') {
        if (Get-Module -Name PowerShellGet -ListAvailable | Where-Object {$_.Version -ge '2.2.5'}) {
            Write-Host -ForegroundColor Cyan 'PowerShellGet 2.2.5 or greater is installed'
        }
        else {
            Write-Host -ForegroundColor Cyan 'Install-Package PackageManagement,PowerShellGet'
            Install-Package -Name PowerShellGet -MinimumVersion 2.2.5 -Force -Confirm:$false -Source PSGallery | Out-Null
    
            Write-Host -ForegroundColor Cyan 'Import-Module PackageManagement,PowerShellGet'
            Import-Module PackageManagement,PowerShellGet -Force
        }
    }
}

Step-oobeExecutionPolicy
Step-oobePackageManagement
