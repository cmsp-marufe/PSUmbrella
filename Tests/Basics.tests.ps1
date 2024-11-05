#Get API keys
$creds = Get-Credential
#test faulty credentials
$badCreds = Get-Credential

#Reload the module 
cls
Remove-Module PSUmbrella
Import-Module -Name C:\Users\marufe\GitHub\PSUmbrella
Connect-UmbrellaOnline $creds
#test auth token error messages
Connect-UmbrellaOnline $badCreds


#Get-ManagedProviderCustomer
Get-UmbrellaCustomer -Id 5362852
#troubleshoot SINGLE customer search results by name
$response = Get-ManagedProviderCustomer
$search_results = $response | Where-Object {$_.customerName -match "Irwin"}
$search_results
#troubleshoot MULTIPLE customer search results by name
$temp_customers = Get-ManagedProviderCustomer
$search_results = $temp_customers | Where-Object {$_.customerName -match "LLC"}
$search_results | Measure-Object
$results_count = $search_results | Measure-Object
$results_count

#Get-Network
#Connect-Umbrella $creds
Get-Network 
#troubleshoot SINGLE customer search results by name
$response = Get-Network
$search_results = $response | Where-Object {$_.name -match "MCAA"}
$search_results
#troubleshoot MULTIPLE customer search results by name
$response = Get-Network
$search_results = $temp_customers | Where-Object {$_.customerName -match "LLC"}
$search_results | Measure-Object
$results_count = $search_results | Measure-Object
$results_count