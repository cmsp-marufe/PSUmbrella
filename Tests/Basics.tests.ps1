$creds = Get-Credential

Remove-Module PSUmbrella
Import-Module -Name C:\Users\marufe\GitHub\PSUmbrella -Verbose
Connect-Umbrella $creds
Get-UmbrellaManagedCustomer -Name "LLC"
#troubleshoot SINGLE customer search results by name
$temp_customers = Get-UmbrellaManagedCustomer
$search_results = $temp_customers | Where-Object {$_.customerName -match "Irwin"}
$search_results
#troubleshoot MULTIPLE customer search results by name
$temp_customers = Get-UmbrellaManagedCustomer
$search_results = $temp_customers | Where-Object {$_.customerName -match "LLC"}
$search_results | Measure-Object
$results_count = $search_results | Measure-Object
$results_count