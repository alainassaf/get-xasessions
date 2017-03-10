# get-xasessions
Displays total, active, and disconnected sessions from xA 6.x farm

# PS> get-help .\get-xasessions.ps1 -full

NAME<br>
    get-xasessions.ps1
    
SYNOPSIS<br>
    Displays total, active, and disconnected sessions from xA 6.x farm
    
SYNTAX<br>
	get-xasessions.ps1 [[-XMLBroker] \<Object\>] [\<CommonParameters\>]
    
DESCRIPTION<br>
    Displays total, active, and disconnected sessions from xA 6.x farm
    
PARAMETERS<br>

    -XMLBroker <Object>
        XML Broker to query. Can be a comma separated list.
        
        Required?                    false
        Position?                    1
        Default value                YOURDC.DOMAIN.LOCAL
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS<br>
    None
    
OUTPUTS<br>
    None
    
NOTES<br>
    
        NAME:  get-xasessions
        VERSION:  1.10
        CHANGE LOG - Version - When - What - Who
        1.00 - 03/10/2017 - Initial script - Alain Assaf
        1.10 - 03/10/2017 - Added get-xmlbroker function - Alain Assaf
        LAST UPDATED:  03/10/2017
        AUTHOR:  Alain Assaf
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>get-xasessions.ps1 -XMLBROKER BROKER
    
    Queries the BROKER and retrieves sessions
	
# Legal and Licensing
The get-xasessions.ps1 script is licensed under the [MIT license][].

[MIT license]: LICENSE

# Want to connect?
* LinkedIn - https://www.linkedin.com/in/alainassaf
* Twitter - http://twitter.com/alainassaf
* Wag the Real - my blog - https://wagthereal.com
* Edgesightunderthehood - my other - blog https://edgesightunderthehood.com

# Help
I welcome any feedback, ideas or contributors.
