#Makes both of the "GET Customer" calls available under the "Managed Providers" API endpoint in the admin scope
function Get-UmbrellaManagedCustomer {
    
    [CmdletBinding()]
    param (
        [string]$Id,
        [string]$Name
    )
    
    $Params = @{
        Authentication = "Bearer"
        Token = $script:Token
    }

    if($Id -or $Name) {
        $Params.Add("Uri", $UmbrellaAPIPaths.Admin.ManagedProviderCustomersUrl + "/$Id")
    } else {
        $Params.Add("Uri", $UmbrellaAPIPaths.Admin.ManagedProviderCustomersUrl)
    }

    $customers = Invoke-RestMethod @Params

    $customers
}