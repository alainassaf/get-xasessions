<#
.SYNOPSIS
Displays total, active, and disconnected sessions from xA 6.x farm
.DESCRIPTION
Displays total, active, and disconnected sessions from xA 6.x farm
.PARAMETER XMLBroker
XML Broker to query. Can be a comma separated list.
.EXAMPLE
PS C:\> get-xasessions.ps1 -XMLBROKER BROKER
Queries the BROKER and retrieves sessions
.NOTES
NAME        :  get-xasessions
VERSION     :  1.10
CHANGE LOG - Version - When - What - Who
1.00 - 03/10/2017 - Initial script - Alain Assaf
1.10 - 03/10/2017 - Added get-xmlbroker function - Alain Assaf
LAST UPDATED:  03/10/2017
AUTHOR      :  Alain Assaf
.LINK
http://www.linkedin.com/in/alainassaf/
http://wagthereal.com
.INPUTS
None
.OUTPUTS
None
#>
Param(
    [parameter(Position = 0, Mandatory=$False )]
    [ValidateNotNullOrEmpty()]
    $XMLBroker="YOURDC.DOMAIN.LOCAL"# Change to hardcode a default value for your Delivery Controllers
)

### START FUNCTION: get-xmlbroker #############################################
Function Get-xmlbroker { 
<#
    .SYNOPSIS
    Gets responsive Citrix.
    .DESCRIPTION
    Gets responsive Citrix.
    .PARAMETER XMLBrokers
    Required parameter. Server to use as an XML Broker. Can be a list separated by commas.
    .INPUTS
    None
    .OUTPUTS
    None
    .EXAMPLE
    PS> Get-xmlbroker SERVERNAME
    Query SERVERNAME to see if it responsive. Assumes that SERVERNAME is a Citrix XML Broker
    .LINK
    http://www.linkedin.com/in/alainassaf/
    http://wagthereal.com
    .NOTES
    NAME        :  Get-xmlbroker
    VERSION     :  1.00
    CHANGE LOG - Version - When - What - Who
    1.00 - 03/08/2017 - Initial script - Alain Assaf
    LAST UPDATED:  03/08/2017
    AUTHOR      :  Alain Assaf
#>
    [CmdletBinding()] 
    param ([parameter(Position = 0, Mandatory=$False)]
           [ValidateNotNullOrEmpty()]
           $XMLBrokers
    )
            
    $DC = $XMLBrokers.Split(",")
    foreach ($broker in $DC) {
        if ((Test-Port $broker) -and (Test-Port $broker -port 1494) -and (Test-Port $broker -port 2598))  {
            $XMLBroker = $broker
            break
        }
    }
    Return $XMLBroker
}
### END FUNCTION: get-xmlbroker ###############################################

#Get working XML Broker
$broker = Get-xmlbroker $XMLBroker #Function from Module: ctxModules


$sessions = (Get-XASession -ComputerName $broker | select AccountName,state,Protocol | where {($_.Protocol -eq 'Ica') -and ($_.State -ne 'Listening')} | sort -Property accountname -Unique)
$sessTable = New-Object psobject
$sessTable | Add-Member noteproperty 'Total Sessions' $sessions.Count
$sessTable | Add-Member noteproperty 'Active Sessions' ($sessions | where {$_.State -eq 'Active'}).Count
$sessTable | Add-Member noteproperty 'Disconnected Sessions' ($sessions | where {$_.State -eq 'Disconnected'}).Count
cls
$sessTable | fl