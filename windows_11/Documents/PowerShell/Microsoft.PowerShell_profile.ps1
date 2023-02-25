# Initialize starship
Invoke-Expression (&starship init powershell)

# Set cmdlet alias
Set-Alias -Name open -Value explorer.exe

# Set proxy shell function
#### WARN ####
# Changes to environment variables here are persistent (https://learn.microsoft.com/zh-cn/powershell/module/microsoft.powershell.core/about/about_environment_variables?view=powershell-7.3#saving-changes-to-environment-variables)
function Clear-Proxy
{
  [Environment]::SetEnvironmentVariable('http_proxy', $null, 'User')
  [Environment]::SetEnvironmentVariable('https_proxy', $null, 'User')
  Write-Output "Proxy Disabled"
}
function Set-Proxy
{
  $proxy = "http://127.0.0.1:7890"
  [Environment]::SetEnvironmentVariable('http_proxy', $proxy, 'User')
  [Environment]::SetEnvironmentVariable('https_proxy', $proxy, 'User')
  Write-Output "Proxy Enabled"
}
