<#
This example is used to test new resources and showcase the usage of new resources being worked on.
It is not meant to use as a production baseline.
#>

Configuration Example
{
    param(
        [Parameter(Mandatory = $true)]
        [PSCredential]
        $Credscredential
    )
    Import-DscResource -ModuleName Microsoft365DSC

    node localhost
    {
        EXOMailboxPlan 'ConfigureMailboxPlan'
        {
            Ensure                   = "Present";
            Identity                 = "ExchangeOnlineEnterprise";
            IssueWarningQuota        = "98 GB (105,226,698,752 bytes)";
            MaxReceiveSize           = "25 MB (26,214,400 bytes)";
            MaxSendSize              = "25 MB (26,214,400 bytes)";
            ProhibitSendQuota        = "99 GB (106,300,440,576 bytes)";
            ProhibitSendReceiveQuota = "100 GB (107,374,182,400 bytes)";
            RetainDeletedItemsFor    = "14.00:00:00";
            RoleAssignmentPolicy     = "Default Role Assignment Policy";
            Credential               = $Credscredential
        }
    }
}
