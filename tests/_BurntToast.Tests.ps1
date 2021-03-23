Describe 'BurntToast Module' {
    Context 'meta validation' {
        It 'should import functions' {
            (Get-Module BurntToast).ExportedFunctions.Count | Should -Be 3
        }

        It 'should import aliases' {
            (Get-Module BurntToast).ExportedAliases.Count | Should -Be 1
        }
    }
}
