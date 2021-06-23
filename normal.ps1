$characterLimit = 5
$filePath = "$PSScriptRoot\5.tmp"

if ((Get-Content -path $filePath | Measure-Object -Character).Characters -ge $characterLimit) {
    #logger add stuff here to report
    Write-Output "Greater/Equal to 5"
}