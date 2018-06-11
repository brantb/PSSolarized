# Source all files in src\
$sourceFiles = Get-ChildItem -Path "$PSScriptRoot\src" -Filter "*.ps1" -Recurse
$sourceFiles | ForEach-Object {
    . $_.FullName
}

# Export functions matching filenames in src\public
# Be sure to list each exported functions in the FunctionsToExport field of the module manifest file.
# This improves performance of command discovery in PowerShell.
$sourceFiles | Where-Object { ($_.DirectoryName | Split-Path -Leaf) -eq 'public' } | ForEach-Object {
    Export-ModuleMember -Function $_.BaseName
}

$script:Palette = @{
    Base03  = [PoshCode.Pansies.RgbColor]::new("#002b36")
    Base02  = [PoshCode.Pansies.RgbColor]::new("#073642")
    Base01  = [PoshCode.Pansies.RgbColor]::new("#586e75")
    Base00  = [PoshCode.Pansies.RgbColor]::new("#657b83")
    Base0   = [PoshCode.Pansies.RgbColor]::new("#839496")
    Base1   = [PoshCode.Pansies.RgbColor]::new("#93a1a1")
    Base2   = [PoshCode.Pansies.RgbColor]::new("#eee8d5")
    Base3   = [PoshCode.Pansies.RgbColor]::new("#fdf6e3")

    Yellow  = [PoshCode.Pansies.RgbColor]::new("#b58900")
    Orange  = [PoshCode.Pansies.RgbColor]::new("#cb4b16")
    Red     = [PoshCode.Pansies.RgbColor]::new("#dc322f")
    Magenta = [PoshCode.Pansies.RgbColor]::new("#d33682")
    Violet  = [PoshCode.Pansies.RgbColor]::new("#6c71c4")
    Blue    = [PoshCode.Pansies.RgbColor]::new("#268bd2")
    Cyan    = [PoshCode.Pansies.RgbColor]::new("#2aa198")
    Green   = [PoshCode.Pansies.RgbColor]::new("#859900")
}

# i18n
New-Alias -Name Get-SolarizedColour -Value Get-SolarizedColor
Export-ModuleMember -Alias Get-SolarizedColour
