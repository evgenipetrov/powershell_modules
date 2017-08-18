function Get-NTNetworkAddress
{
  #Content
  param
  (
    [String]
    [Parameter(Mandatory)]
    $IpAddress,
  
    [Parameter(Mandatory)]
    [String]
    $NetMask
  )
  
  $ip = Get-NTIPAddress -Address $IpAddress
  $mask = Get-NTNetworkMask -BitCount $NetMask 

  $addressArray = @(0) * 32 
  
  for ($x = 0; $x -lt 32; $x += 1) 
  {
    $n1 = [convert]::ToInt16($ip.BinaryFormat.ToCharArray()[$x],2)
    $n2 = [convert]::ToInt16($mask.BinaryFormat.ToCharArray()[$x],2)
    $addressArray[$x] = [int]($n1 -and $n2)
  }
  
  $binaryFormat = -join $addressArray
  [ipaddress]$output = Convert-NTBinaryToString -Binary $binaryFormat
  Write-Output $output
}
