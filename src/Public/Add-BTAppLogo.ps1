function Add-BTAppLogo {
    <#
        .SYNOPSIS
        Override the app logo with custom image of choice that will be displayed on the toast.

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
                   ValueFromPipeline)]
        [Microsoft.Toolkit.Uwp.Notifications.ToastContentBuilder] $ContentBuilder,

        # The URI of the image. Can be from your application package, application data, or the internet. Internet images must be less than 200 KB in size.
        [Parameter(Position = 0)]
        [ValidateNotNullOrEmpty()]
        [Alias('Uri')]
        [Uri] $Source = $Script:DefaultImage,

        # Specify how the image should be cropped.
        [Microsoft.Toolkit.Uwp.Notifications.AdaptiveImageCrop] $Crop,

        # A description of the image, for users of assistive technologies.
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
        } elseif ($AlternateText) {
            $null = $ContentBuilder.AddAppLogoOverride($Source, 'Default', $AlternateText)
        } else {
            $null = $ContentBuilder.AddAppLogoOverride($Source)
        }
    }
    end {}
}