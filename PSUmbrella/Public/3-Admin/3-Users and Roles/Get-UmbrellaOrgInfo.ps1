#API Operation Id: getOrganizationInformation

function Get-UmbrellaOrgInfo {
    
    [CmdletBinding(DefaultParameterSetName='By Email')]
    param (
        [parameter(ParameterSetName="By Email",Mandatory=$true)]
        [string]$Email,
        [parameter(ParameterSetName="By Email",Mandatory=$false)]
        [int]$Page,
        [int]$Offset,
        [int]$Limit

    )
    
    #Set the static parameters
    $Params = @{
        Uri = $UmbrellaAPIPaths.Admin.OrganizationsUrl
        Authentication = "Bearer"
        Token = $script:Token
        headers = @{
            email = $Email
        }
    }
    
    #Include additional parameters if specified
    
    if ($Page) {
        $Params.headers.Add("page",$Page)
    } 
    if($Offset) {
        $Params.headers.Add("offset",$Offset)
    }
    if($Limit) {
        $Params.headers.Add("limit",$Limit)
    }


    
    $Orgs = Invoke-RestMethod @Params

    $Orgs
}