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
        # The toast content builder obejct that represents the toast notification being constructed.
        [Parameter(Mandatory,
                   ValueFromPipeline)]
        [Microsoft.Toolkit.Uwp.Notifications.ToastContentBuilder] $ContentBuilder,

        # The URI of the image. Can be from your local computer, network location, or the internet.
        # Online images will be downloaded and cached in the user's TEMP directory for future use.
        [Parameter(Position = 0)]
        [ValidateNotNullOrEmpty()]
        [Alias('Uri')]
        [Uri] $Source = $Script:DefaultImage,

        # Specify how the image should be cropped.
        [Microsoft.Toolkit.Uwp.Notifications.AdaptiveImageCrop] $Crop,

        # A description of the image, for users of assistive technologies.
        [string] $AlternateText,

        # Specify that the online images should be downloaded, regardless of if they have been cached to the TEMP directory.
        # Used when the online resource has been updated and you need to ensure that users see the latest version.
        [switch] $IgnoreCache
    )

    begin {}
    process {
        $paramCrop    = if ($Crop) {$Crop} else {'Default'}
        $paramAltText = if ($AlternateText) {$AlternateText} else {$null}
        $paramQuery   = if ($AddImageQuery) {$AddImageQuery} else {$null}

        $paramSrc = if ($IgnoreCache) {
            Optimize-BTImageSource -Source $Source -ForceRefresh
        } else {
            Optimize-BTImageSource -Source $Source
        }

        $null = $ContentBuilder.AddAppLogoOverride($paramSrc,
                                                   $paramCrop,
                                                   $paramAltText,
                                                   $paramQuery)
    }
    end {}
}