Describe 'Get-SolarizedColor' {

    It 'returns all colors' {
        $colors = Get-SolarizedColor
        $colors.Count | Should -BeGreaterOrEqual 16
    }

    @(
        'Base03'
        'Base02'
        'Base01'
        'Base00'
        'Base0'
        'Base1'
        'Base2'
        'Base3'
        'Yellow'
        'Orange'
        'Red'
        'Magenta'
        'Violet'
        'Blue'
        'Cyan'
        'Green'
    ) | ForEach-Object {
        It "returns the color $_" {
            Get-SolarizedColor -Name $_ | Should -BeOfType [PoshCode.Pansies.RgbColor]
        }
        It 'adds a SolarizedName property' {
            Get-SolarizedColor -Name $_ | Select-Object -ExpandProperty SolarizedName | Should -Be $_
        }
    }

    It 'supports body text' {
        Get-SolarizedColor -Name body | Should -Be (Get-SolarizedPalette).Base0
    }

    It 'returns null for invalid colors' {
        Get-SolarizedColor -Name nosuchcolor | Should -BeNullOrEmpty
    }
}
