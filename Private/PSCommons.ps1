#Define the API Endpoint Paths
$UmbrellaAPIPaths = [ordered]@{
    AuthUrl = "https://api.umbrella.com/auth/v2";
    DeploymentsUrl = 'https://api.umbrella.com/deployments/v2';
    AdminUrl = 'https://api.umbrella.com/admin/v2';
    PoliciesUrl = 'https://api.umbrella.com/policies/v2';
    #ReportsUrl = 'https://api.umbrella.com/reports/v2';
}
 
#Define Auth Subpaths
$UmbrellaAPIPaths.Add("Auth", @{
    "TokenUrl" = $UmbrellaAPIPaths.AuthUrl + '/token';
})

#Define Deployment Subpaths
$UmbrellaAPIPaths.Add("Deployments", @{
    "NetworksUrl" = $UmbrellaAPIPaths.DeploymentsUrl + '/networks';
    "InternalNetworksUrl" = $UmbrellaAPIPaths.DeploymentsUrl + '/internalnetworks';
    "InternalDomainsUrl" = $UmbrellaAPIPaths.DeploymentsUrl + '/internaldomains';
    "SitesUrl" = $UmbrellaAPIPaths.DeploymentsUrl + '/sites';
    "VirtualAppliancesUrl" = $UmbrellaAPIPaths.DeploymentsUrl + '/virtualappliances';
    "RoamingComputersUrl" = $UmbrellaAPIPaths.DeploymentsUrl + '/roamingcomputers';
    "NetworkTunnelsUrl" = $UmbrellaAPIPaths.DeploymentsUrl + '/datacenters';
    "NetworkDevicesUrl" = $UmbrellaAPIPaths.DeploymentsUrl + '/networkdevices';
    "PoliciesUrl" = $UmbrellaAPIPaths.DeploymentsUrl + '/policies';
})
 
#Define Admin Subpaths
$UmbrellaAPIPaths.Add("Admin", @{
    "ManagedProviderCustomersUrl" = $UmbrellaAPIPaths.AdminUrl + '/managed/customers';
    "UsersUrl" = $UmbrellaAPIPaths.AdminUrl + '/users';
    "RolesUrl" = $UmbrellaAPIPaths.AdminUrl + '/roles';
    "OrganizationsUrl" = $UmbrellaAPIPaths.AdminUrl + '/organizations';
})

#Define Policies Subpaths
$UmbrellaAPIPaths.Add("Policies", @{
    "DestinationListsUrl" = $UmbrellaAPIPaths.PoliciesUrl + '/destinationlists';
})

#Define Reports Subpaths
#coming soon

#Define shared functions
function ConvertFrom-SecureStringToPlainText ([System.Security.SecureString]$SecureString) {

    [System.Runtime.InteropServices.Marshal]::PtrToStringAuto(
    
        [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecureString)
    )            
}
New-Alias -Name s2p -Value ConvertFrom-SecureStringToPlainText