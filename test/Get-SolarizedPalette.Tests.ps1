Describe 'Get-SolarizedPalette' {
    It 'has items' {
        Get-SolarizedPalette | Should -Not -BeNullOrEmpty
        (Get-SolarizedPalette).Red | Should -Not -BeNullOrEmpty
    }

    It 'cannot be emptied' {
        (Get-SolarizedPalette).Clear()
        Get-SolarizedPalette | Should -Not -BeNullOrEmpty
    }

}
