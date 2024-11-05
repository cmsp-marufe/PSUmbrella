#Makes the "listRoles" API operation
#Work in progress, not yet functional
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