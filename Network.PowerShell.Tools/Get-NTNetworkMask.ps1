function Get-NTNetworkMask
{
  param(
    [Int]
    [Parameter(Mandatory)]
    $BitCount
  )
    
  
  $binaryFormat = '00000000000000000000000000000000'
  $binaryArray = $binaryFormat.ToCharArray()
  for ($x = 0; $x -lt $BitCount; $x += 1) 
  {
    $binaryArray[$x] = '1'
  }
  $binaryFormat = -join $binaryArray 
  
  $stringFormat = Convert-NTBinaryToString -Binary $binaryFormat
  
  $property = @{
    'BitCount'   = [int]$BitCount
    'BinaryFormat' = $binaryFormat
    'StringFormat' = $stringFormat
  } 
     
  $output = New-Object -TypeName PSObject -Property $property 
     
  Write-Output -InputObject $output
}
