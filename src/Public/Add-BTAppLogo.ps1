function Add-BTAppLogo {
    <#
        .SYNOPSIS

        .DESCRIPTION

        .INPUTS

        .OUTPUTS

        .EXAMPLE

        .NOTES

        .LINK

    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory,
                   ValueFromPipeline,
                   Position = 0)]
        [Microsoft.Toolkit.Uwp.Notifications.ToastContentBuilder] $ContentBuilder,

        [Parameter(Position = 1)]
        [ValidateNotNullOrEmpty()]
        [Alias('Uri')]
        [Uri] $Source = $Script:DefaultImage,

        [Microsoft.Toolkit.Uwp.Notifications.AdaptiveImageCrop] $Crop,

        [string] $AlternateText
    )

    begin {}
    process {
        if ($Crop) {
            if ($AlternateText) {
                $null = $ContentBuilder.AddAppLogoOverride($Source, $Crop, $AlternateText)
            } else {
                $null = $ContentBuilder.AddAppLogoOverride($Source, $Crop)
            }
        } else {
            $null = $ContentBuilder.AddAppLogoOverride($Source)
        }
    }
    end {}
}