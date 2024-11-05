#Makes both of the "GET Customer" calls available under the "Managed Providers" API endpoint in the admin scope
function Get-UmbrellaManagedCustomer {
    
    [CmdletBinding()]
    param (
        [string]$Id,
        [string]$Name
    )
    
    $uri = $UmbrellaAPIPaths.Admin.ManagedProviderCustomersUrl
    
    $temp_token = ConvertFrom-SecureStringToPlainText $script:token
    $headers = @{"Authorization" = "Bearer $temp_token" }

    $Params = @{
        Method  = "GET"
        Headers = $headers
    }

    if ($Id -or $Name) {
        if ($Name) {
            $Params.Add("Uri", $uri)
            $response = Invoke-RestMethod @Params
            $search_results = $response | Where-Object { $_.customerName -match $Name }
            $results_count = $($search_results | Measure-Object).Count
            #Write-Host $results_count
            if ($results_count -eq 1) {
                $search_results
            }
            elseif ($results_count -eq 0) {
                Write-Host "Your search returned no results."
                
            } else {
                Write-Host "Your search returned multiple results. See the results below:"
                $search_results | Out-Default
                Write-Host "Run this cmdlet again, but with the -Id parameter and the ID number of the entry you want instead of -Name, or use a more specific search string."
            }
        }
        if ($Id) {
            $Params.Add("Uri", $uri + "/$Id")

            $response = Invoke-RestMethod @Params

            $response
        }
    }
    else {
        $Params.Add("Uri", $uri)

        $response = Invoke-RestMethod @Params

        $response
    }

    
}
