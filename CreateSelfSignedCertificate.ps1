function Create-SelfSignedCertificateInFile{
  [CmdletBinding()]
  param(
    [string] $filePath,
    [string] $password)
        $certData = New-SelfSignedCertificate -certstorelocation cert:\localmachine\my -dnsname localhost
        $pwd = ConvertTo-SecureString -String $password -Force -AsPlainText
        Export-PfxCertificate -cert "cert:\localMachine\my\$($certData.Thumbprint)" -FilePath $filePath -Password $pwd
}