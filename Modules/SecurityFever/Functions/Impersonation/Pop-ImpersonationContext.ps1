<#
    .SYNOPSIS
        Leave the current impersonation context.

    .DESCRIPTION
        If the current session was impersonated with Push-ImpersonationContext,
        this command will leave the impersonation context.

    .INPUTS
        None.

    .OUTPUTS
        None.

    .EXAMPLE
        PS C:\> Pop-ImpersonationContext
        Leave the current impersonation context.

    .NOTES
        Author     : Claudio Spizzi
        License    : MIT License

    .LINK
        https://github.com/claudiospizzi/SecurityFever
#>
function Pop-ImpersonationContext
{
    [CmdletBinding()]
    param ()

    Initialize-ImpersonationContext

    if ($Script:ImpersonationContext.Count -gt 0)
    {
        # Get the latest impersonation context
        $popImpersonationContext = $Script:ImpersonationContext.Pop()

        # Undo the impersonation
        $popImpersonationContext.Undo()
    }
}
