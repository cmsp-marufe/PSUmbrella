#Makes both of the "GET Customer" calls available under the "Managed Providers" API endpoint in the admin scope
function Get-UmbrellaManagedCustomer {
    
    [CmdletBinding()]
    param (
        [string]$Id
    )
    
    $Encoded = [System.Text.Encoding]::UTF8.GetBytes($Id)
    $authorizationInfo = [System.Convert]::ToBase64String($Encoded)
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
