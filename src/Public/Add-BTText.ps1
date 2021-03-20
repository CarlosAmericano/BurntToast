function Add-BTText {
    <#
        .SYNOPSIS
        Add text to the toast.

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

        # Custom text to display on the tile.
        [Parameter(Mandatory,
                   Position = 0)]
        [ValidateNotNull()]
        [string[]] $Text,

        # The maximum number of lines the text element is allowed to display.
        [ValidateRange(1,4)]
        [int] $MaxLines,

        # The target locale of the XML payload, specified as a BCP-47 language tags such as "en-US" or "fr-FR".
        # The locale specified here overrides any other specified locale, such as that in binding or visual.
        [string] $Language
    )

    begin {}
    process {
        $paraStyle    = $null
        $paraWrap     = $null
        $paraMaxLines = if ($MaxLines) {$MaxLines} else {$null}
        $paraMinLines = $null
        $paraAlign    = $null
        $paraLanguage = if ($Language) {$Language} else {$null}

        foreach ($Line in $Text) {
            $null = $ContentBuilder.AddText($Line,
                                            $paraStyle,
                                            $paraWrap,
                                            $paraMaxLines,
                                            $paraMinLines,
                                            $paraAlign,
                                            $paraLanguage)
        }
    }
    end {}
}