function New-BTContentBuilder {
    <#
        .SYNOPSIS

        .DESCRIPTION

        .INPUTS

        .OUTPUTS

        .EXAMPLE

        .NOTES

        .LINK

    #>

    [Alias('Builder')]
    [CmdletBinding()]
    param ()

    [Microsoft.Toolkit.Uwp.Notifications.ToastContentBuilder]::new()
}