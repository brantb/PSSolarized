Describe 'Get-SolarizedColor' {

    It 'returns an RgbColor' {
        Get-SolarizedColor -Name 'Red' | Should -BeOfType [PoshCode.Pansies.RgbColor]
    }

    $colorNameTests = (Get-SolarizedPalette).GetEnumerator() | ForEach-Object {
        @{ Name = $_.Name; Expected = $_.Value }
    }
    It 'supports each color from Get-SolarizedPalette' -TestCases $colorNameTests {
        param($Name, $Expected)
        Get-SolarizedColor -Name $Name | Should -Be $Expected
    }

    It 'supports named colors' {
        Get-SolarizedColor -Name body | Should -Be (Get-SolarizedPalette).Base0
    }

    It 'returns null for invalid colors' {
        Get-SolarizedColor -Name nosuchcolor | Should -BeNullOrEmpty
    }
}
