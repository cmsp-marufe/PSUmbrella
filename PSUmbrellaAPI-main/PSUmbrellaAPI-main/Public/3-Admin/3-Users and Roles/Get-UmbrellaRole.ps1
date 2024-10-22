#Makes the "listRoles" API operation
function Get-UmbrellaRole {
    
    #Set the static parameters
    $Params = @{
        Uri = $UmbrellaAPIPaths.Admin.RolesUrl
        Authentication = "Bearer"
        Token = $script:Token
    }
    
    $roles = Invoke-RestMethod @Params

    $roles
}