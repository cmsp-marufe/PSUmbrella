#Makes both of the "GET Customer" calls available under the "Managed Providers" API endpoint in the admin scope
function Get-UmbrellaManagedCustomer {
    
    [CmdletBinding()]
    param (
        [string]$Id
    )
    
    $temp_token = ConvertFrom-SecureStringToPlainText $script:token
    $headers = @{"Authorization"="Bearer $temp_token"}

    $Params = @{
        Method = "GET"
        Headers = $headers
    }

    if($Id) {
        $Params.Add("Uri", $UmbrellaAPIPaths.Admin.ManagedProviderCustomersUrl + "/$Id")
    } else {
        $Params.Add("Uri", $UmbrellaAPIPaths.Admin.ManagedProviderCustomersUrl)
    }

    $customers = Invoke-RestMethod @Params

    $customers
}
