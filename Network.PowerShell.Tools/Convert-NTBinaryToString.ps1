function Convert-NTBinaryToString
{
  param
  (
    [String]
    [Parameter(Mandatory)]
    $Binary
  )
      
  $octet1Binary = $Binary.Substring(0,8)
  $octet2Binary = $Binary.Substring(8,8)
  $octet3Binary = $Binary.Substring(16,8)
  $octet4Binary = $Binary.Substring(24,8)
  
  $octet1Binary = [convert]::ToInt32($octet1Binary,2)
  $octet2Binary = [convert]::ToInt32($octet2Binary,2)
  $octet3Binary = [convert]::ToInt32($octet3Binary,2)
  $octet4Binary = [convert]::ToInt32($octet4Binary,2)
  
  $output = '{0}.{1}.{2}.{3}' -f $octet1Binary, $octet2Binary, $octet3Binary, $octet4Binary
    
  Write-Output -InputObject $output
}
