#Makes the "POST Customer" call available under the "Managed Providers" API endpoint in the Admin scope
function New-UmbrellaCustomer {
    
    [CmdletBinding()]
    param (
        [int]$Seats,
        [string]$CustomerName
    )
    
    $uri = $UmbrellaAPIPaths.Admin.ManagedProviderCustomersUrl
    
    $Params = @{
        Method  = "POST"
        Authentication = "Bearer"
        Token = $script:token
        Uri = $uri
    }

    if ($Seats -and $CustomerName) {
        $Params.Add("Body","{""customerName"": $CustomerName, ""seats"": $Seats}")
        $response = Invoke-RestMethod @Params
        $response
    }
    else {
        $Params.Add("Uri", $uri)
        $response = Invoke-RestMethod @Params
        $response
    }    
}
