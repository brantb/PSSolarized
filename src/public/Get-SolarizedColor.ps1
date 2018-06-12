function Get-SolarizedColor {
    [CmdletBinding()]
    param(
        [Parameter(Position = 0)]
        [string] $Name,

        [Parameter()]
        [switch] $Highlight
    )

    $colors = if (-not $Name) {
        $script:Palette.PSObject.Properties.Name
    }
    else {
        switch ($Name) {
            # Some named values for convenience
            { $Name -in 'Foreground', 'FG', 'Body' } {
                if ($Highlight) { 'Base1' } else { 'Base0' }
            }
            { $Name -in 'Background', 'BG' } {
                if ($Highlight) { 'Base02' } else { 'Base03' }
            }
            { $Name -in 'Comment', 'Secondary' } {
                'Base01'
            }
            Default { $Name }
        }
    }
    $colors | ForEach-Object {
        if ($script:Palette.$_) {
            [PoshCode.Pansies.RgbColor]::new($script:Palette.$_) | Add-Member -PassThru -Type NoteProperty -Name 'SolarizedName' -Value $_
        }
    }
}
