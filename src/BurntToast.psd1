@{
    RootModule        = 'BurntToast.psm1'
    ModuleVersion     = '1.0.0'
    # Can only use CompatiblePSEditions if PowerShellVersion is set to 5.1, not sure about limiting this to that version yet.
    # CompatiblePSEditions = @('Desktop')
    GUID              = '751a2aeb-a68f-422e-a2ea-376bdd81612a'
    Author            = 'Joshua (Windos) King'
    CompanyName       = 'king.geek.nz'
    Copyright         = '(c) 2015 Joshua (Windos) King. All rights reserved.'
    Description       = 'Module for creating and displaying Toast Notifications on Microsoft Windows 10.'
    PowerShellVersion = '5.0'
    FunctionsToExport = 'New-BurntToastNotification',
                        'Submit-BTNotification',
                        'Update-BTNotification'
    CmdletsToExport   = @()
    AliasesToExport   = @('Toast')
    PrivateData       = @{
        PSData = @{
            Tags         = @('Notifications', 'Utilities', 'Windows10', 'Toast')
            Prerelease   = 'Preview1'
            LicenseUri   = 'https://github.com/Windos/BurntToast/blob/main/LICENSE'
            ProjectUri   = 'https://github.com/Windos/BurntToast'
            IconUri      = 'https://raw.githubusercontent.com/Windos/BurntToast/main/Media/BurntToast-Logo.png'
            ReleaseNotes = '# 1.0.0-Preview1

*
'
        }
    }
}
