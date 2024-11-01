#Makes both of the "GET Customer" calls available under the "Managed Providers" API endpoint in the admin scope
function Get-UmbrellaManagedCustomer {
    
    [CmdletBinding()]
    param (
        [string]$Id
    )
    
    $headers = @{
        Authorization = "Bearer $script:token"}
    }

    $Params = @{
        Method = "GET"
        Headers = $headers
    }

    if($Id) {
        $Params.Add("Uri", $UmbrellaAPIPaths.Admin.ManagedProviderCustomersUrl + "/$Id")
    } elseif {
        $Params.Add("Uri", $UmbrellaAPIPaths.Admin.ManagedProviderCustomersUrl)
    }

    $customers = Invoke-RestMethod @Params

    $customers
}
