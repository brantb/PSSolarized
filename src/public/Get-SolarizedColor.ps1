function Get-SolarizedColor {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [string] $Name,

        [Parameter()]
        [switch] $Highlight
    )

    $color = switch ($Name) {
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

    $script:Palette[$color]
}
