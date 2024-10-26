#Makes the "Create Authorization Token" API call

function Connect-Umbrella {
    [CmdletBinding()]
    param (
        [ValidateNotNull()]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.Credential()]
        $Credential = [System.Management.Automation.PSCredential]::Empty
    )
    
    if($Credential -ne [System.Management.Automation.PSCredential]::Empty) {
        $Params = @{
            Uri = $UmbrellaAPIPaths.Auth.TokenUrl
            Authentication = "Basic"
            Credential = $Credential
        }
    } else {
        $Params = @{
            Uri = $UmbrellaAPIPaths.Auth.TokenUrl
            Authentication = "Basic"
            Credential = (Get-Credential)
        }
    }

    $Session = Invoke-RestMethod @Params
    $Session | Out-Host
    $temp_token = $Session.access_token | ConvertTo-SecureString -AsPlainText -Force
    Set-Variable -Name Token -Value $temp_token -Scope Script -Option ReadOnly -Force
}
