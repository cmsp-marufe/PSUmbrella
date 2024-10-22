#Makes the "getUser" and "listUsers" API operations
function Get-UmbrellaUser {
    
    [CmdletBinding(DefaultParameterSetName='All Users')]
    param (
        [parameter(ParameterSetName="All Users",Mandatory=$false)]
        [parameter(ParameterSetName="By Id",Mandatory=$true)]
        [string]$Id,
        [parameter(ParameterSetName="By Email",Mandatory=$true)]
        [string]$Email
    )
    
    #Set the static parameters
    $Params = @{
        Uri = $UmbrellaAPIPaths.Admin.UsersUrl
        Authentication = "Bearer"
        Token = $script:Token
    }
    
    #Determine whether we're requesting by email or Id
    if ($Id -or $Email) {
        if ($Id) {
            $Params["Uri"] = $UmbrellaAPIPaths.Admin.UsersUrl + "/$Id"
        } else {
            $users = Invoke-RestMethod @Params
            $Id = $($users | Where-Object {$_.email -eq "$Email"}).Id
            $Params["Uri"] = $UmbrellaAPIPaths.Admin.UsersUrl + "/$Id"
        }
    }

    $users = Invoke-RestMethod @Params

    $users
}