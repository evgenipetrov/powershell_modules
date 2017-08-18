function Get-NTNetworkBroadcastAddress
{
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
  $binaryFormat = $ip.BinaryFormat
  
  $sb = New-Object -TypeName 'System.Text.StringBuilder'
  [void]$sb.Append($binaryFormat)
  
  for ($x = 0; $x -lt (32-$NetMask); $x += 1) 
  {
    $sb[31-$x] = '1'
  }
    
  $binaryFormat = $sb.ToString()
  $output = Convert-NTBinaryToString -Binary $binaryFormat
  
  Write-Output -InputObject $output
}

