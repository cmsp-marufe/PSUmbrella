#Makes both of the "GET Customer" calls available under the "Managed Providers" API endpoint in the admin scope
function Get-UmbrellaManagedCustomer {
    
    [CmdletBinding()]
    param (
        [string]$Id,
        [string]$Name
    )
    
    $temp_token = ConvertFrom-SecureStringToPlainText $script:token
    $headers = @{"Authorization" = "Bearer $temp_token" }

    $Params = @{
        Method  = "GET"
        Headers = $headers
    }

    if ($Id -or $Name) {
        if ($Name) {
            $Params.Add("Uri", $UmbrellaAPIPaths.Admin.ManagedProviderCustomersUrl)
            $temp_customers = Invoke-RestMethod @Params
            $search_results = $temp_customers | Where-Object { $_.customerName -match $Name }
            $results_count = $search_results | Measure-Object
            #Write-Host $results_count
            if ($results_count.Count -eq 1) {
                $search_results
            }
            else {
                Write-Host "Your search returned multiple results. See the results below:"
                $customers = $search_results
                $customers | Out-Default
                Write-Host "Run this cmdlet again, but with the -Id parameter and the ID number of the customer instead of -Name, or use a more specific search string."
            }
        }
        if ($Id) {
            $Params.Add("Uri", $UmbrellaAPIPaths.Admin.ManagedProviderCustomersUrl + "/$Id")

            $customers = Invoke-RestMethod @Params

            $customers
        }
    }
    else {
        $Params.Add("Uri", $UmbrellaAPIPaths.Admin.ManagedProviderCustomersUrl)

        $customers = Invoke-RestMethod @Params

        $customers
    }

    
}
