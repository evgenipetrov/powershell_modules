$modulePaths = $env:PSModulePath -split ";"

if ($modulePaths -notcontains $PSScriptRoot)
{
  $modulePaths += $PSScriptRoot
  $env:PSModulePath = $modulePaths -join ";"
}
