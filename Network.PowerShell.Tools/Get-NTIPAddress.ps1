function Get-NTIPAddress
{
  #Content
  param
  (
    [String]
    [Parameter(Mandatory)]
  $Address)
    
  [ipaddress]$ip = $Address
    
  $addressBytes = $ip.GetAddressBytes()
    
  [string]$binaryFormat = ''
  foreach ($addressByte in $addressBytes)
  {
    $octetBinary = '00000000'
    #$octetArray = $octetBinary.ToCharArray()
    $sb = New-Object -TypeName 'System.Text.StringBuilder'
    [void]$sb.Append($octetBinary)

    $addressOctetBinary = [convert]::ToString($addressByte,2)
    $addressOctetBinaryArray = $addressOctetBinary.ToCharArray()

    [array]::Reverse($addressOctetBinaryArray)
    for ($x = 0; $x -lt $addressOctetBinary.Length; $x += 1) 
    {
      $sb[$x] = $addressOctetBinaryArray[$x]
    }
    $octetArray = $sb.ToString().ToCharArray()
    [array]::Reverse($octetArray)
    $octetBinary = -join $octetArray
    $binaryFormat += $octetBinary
  }
    
  $ip | Add-Member -MemberType NoteProperty -Name 'BinaryFormat' -Value $binaryFormat
    
  Write-Output -InputObject $ip
}

Get-NTIPAddress -Address 192.168.2.3