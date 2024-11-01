#Makes both of the "GET Customer" calls available under the "Managed Providers" API endpoint in the admin scope
function Get-UmbrellaManagedCustomer {
    
    [CmdletBinding()]
    param (
        [string]$Id
    )
    
    $authorizationInfo = [System.Convert]::ToBase64String($script:token)
    $headers = @{"Authorization"="Bearer $($authorizationInfo)"}

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
