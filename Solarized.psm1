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

$script:Palette = [pscustomobject]@{
    Base03  = '#002b36'
    Base02  = '#073642'
    Base01  = '#586e75'
    Base00  = '#657b83'
    Base0   = '#839496'
    Base1   = '#93a1a1'
    Base2   = '#eee8d5'
    Base3   = '#fdf6e3'

    Yellow  = '#b58900'
    Orange  = '#cb4b16'
    Red     = '#dc322f'
    Magenta = '#d33682'
    Violet  = '#6c71c4'
    Blue    = '#268bd2'
    Cyan    = '#2aa198'
    Green   = '#859900'
}

# i18n
New-Alias -Name Get-SolarizedColour -Value Get-SolarizedColor
Export-ModuleMember -Alias Get-SolarizedColour
