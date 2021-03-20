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
                   ValueFromPipeline,
                   Position = 0)]
        [Microsoft.Toolkit.Uwp.Notifications.ToastContentBuilder] $ContentBuilder,

        [Parameter(Mandatory,
                   Position = 1)]
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