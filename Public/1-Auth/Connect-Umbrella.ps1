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
        $creds = $Credential
    }else { 
        $creds = (Get-Credential)
    }

    $auth = $creds.UserName + ':' + (ConvertFrom-SecureStringToPlainText $creds.Password)
    $Encoded = [System.Text.Encoding]::UTF8.GetBytes($auth)
    $authorizationInfo = [System.Convert]::ToBase64String($Encoded)
    $headers = @{"Authorization"="Basic $($authorizationInfo)"}
    
    $response = Invoke-RestMethod -Uri $UmbrellaAPIPaths.Auth.TokenUrl -Method "POST" -Headers $headers
    
    if($null -ne $response.access_token) {
        $temp_token = $response.access_token | ConvertTo-SecureString -AsPlainText -Force
        Set-Variable -Name token -Value $temp_token -Scope Script -Option ReadOnly -Force
        Write-Host "Now connected to Umbrella API"
    }
}
