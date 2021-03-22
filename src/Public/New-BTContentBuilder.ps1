function New-BTContentBuilder {
    <#
        .SYNOPSIS
        Create a toast builder object.

        .DESCRIPTION
        This New-BTContentBuilder function creates a new toast content builder obejct to construct a complete notification.

        .INPUTS
        None. You cannot pipe objects to New-BTContentBuilder.

        .OUTPUTS
        Microsoft.Toolkit.Uwp.Notifications.ToastContentBuilder

        .EXAMPLE
        $Builder = New-BTContentBuilder

        This example creates a new toast content builder object and storing it in a variable named $Builder.

        .EXAMPLE
        $Builder = Builder

        This example creates a new toast content builder object using the Builder alias and storing it in a variable named $Builder.

        .LINK
        https://docs.toastit.dev/commands/new-btcontentbuilder
    #>

    [Alias('Builder')]
    [CmdletBinding()]
    param ()

    [Microsoft.Toolkit.Uwp.Notifications.ToastContentBuilder]::new()
}