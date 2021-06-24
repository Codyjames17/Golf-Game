Clear-Host

function Set-CharacterLimit {
    param(
        [Parameter(Mandatory)]
        [int]$characterLimit
    )

    $returnVar = 0

    for ($i = 1; $i -le $characterLimit; $i++) {
        $returnVar = $i
    }

    return $returnVar
}

function Set-FilePath {
    param(
        [Parameter(Mandatory)]
        [string]$fileName
    )

    $scriptPath = $PSCommandPath
    $pathArray = $scriptPath.Split("\")

    $newPath = @()
    foreach ($part in $pathArray) {
        if ($part -ne $pathArray[-1]) {
            $newPath = $newPath += $part
        }
    }

    $newPathString = [system.String]::Join("\", $newPath)
    $newPathString = $newPathString + "\"
    $newPathString = $newPathString + $fileName

    return $newPathString

}

function Test-FileExists {
    param(
        [Parameter(Mandatory)]
        [string]$filePath
    )

    if ( -not (Test-Path -Path $filePath -PathType Leaf)) {
        exit
    }

}

function Get-AllContent {
    param(
        [Parameter(Mandatory)]
        [string]$filePath
    )

    $content = Get-Content -path $filePath -Raw
    $content = $content.Trim()

    return $content
}

function Show-StringCharCount {
    param(
        [Parameter(Mandatory)]
        [string]$content
    )

    $charArray = $content.ToCharArray()

    $counter = 0
    foreach ($char in $charArray) {
        $counter = $counter + 1
    }

    return $counter
}

function Compare-LimitToFile {
    param(
        [Parameter(Mandatory)]
        [int]$characterLimit,
        [int]$characterCount
    )

    $characterLimitArray = @()
    for ($i = 1; $i -le $characterLimit; $i++) {
        $characterLimitArray += $i
    }

    $characterCountArray = @()
    for ($i = 1; $i -le $characterCount; $i++) {
        $characterCountArray += $i
    }

    $characterLimitArrayCount = 0
    foreach ($char in $characterLimitArray) {
        $characterLimitArrayCount++
    }

    $characterCountArrayCount = 0
    foreach ($char in $characterCountArray) {
        $characterCountArrayCount++
    }

    if ($characterCountArrayCount -ge $characterLimitArrayCount) {
        #logger add stuff here to report
        Write-Output "Greater/Equal to 5"
    }
    
}

$characterLimit = Set-CharacterLimit -characterLimit 5
$filePath = Set-FilePath -fileName "5.tmp"
Test-FileExists -filePath $filePath
$file = Get-AllContent -filePath $filePath
$fileCharacterCount = Show-StringCharCount -content $file
Compare-LimitToFile -characterLimit $characterLimit -characterCount $fileCharacterCount