function Add-BTText {
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
                   ValueFromPipeline)]
        [Microsoft.Toolkit.Uwp.Notifications.ToastContentBuilder] $ContentBuilder,

        [Parameter(Mandatory,
                   Position = 0)]
        [ValidateNotNull()]
        [string[]] $Text
    )

    begin {}
    process {
        foreach ($Line in $Text) {
            $null = $ContentBuilder.AddText($Line)
        }
    }
    end {}
}