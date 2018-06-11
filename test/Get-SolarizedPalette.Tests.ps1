Describe 'Get-SolarizedPalette' {
    It 'works' {
        Get-SolarizedPalette | Should -BeOfType [PSCustomObject]
    }
}
