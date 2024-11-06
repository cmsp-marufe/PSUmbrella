#Makes the "Create Authorization Token" API call

function Connect-UmbrellaOnline {
    [CmdletBinding(PositionalBinding = $false)]
    param (
        [Parameter(ValueFromPipelineByPropertyName)]
        [ValidateNotNull()]
        [int]$OrgId,
        [Parameter(Position = 0)]
        [ValidateNotNull()]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.Credential()]
        $Credential = [System.Management.Automation.PSCredential]::Empty
    )
    
    if ($Credential -ne [System.Management.Automation.PSCredential]::Empty) {
        $script:creds = $Credential
    }
    else { 
        $script:creds = (Get-Credential)
    }

    if ($OrgId) {
        $headers = @{
            'X-Umbrella-OrgId' = $OrgId
        }
        $response = Invoke-RestMethod -Uri $UmbrellaAPIPaths.Auth.TokenUrl -Authentication Basic -Method "POST" -Credential $creds -StatusCodeVariable responseStatus -SkipHttpErrorCheck -Headers $headers
    }
    else {
        $response = Invoke-RestMethod -Uri $UmbrellaAPIPaths.Auth.TokenUrl -Authentication Basic -Method "POST" -Credential $creds -StatusCodeVariable responseStatus -SkipHttpErrorCheck
    }

    
    switch ($responseStatus) {
        200 {
            Write-Host "Now connected to Umbrella API"
            if ($OrgId) {
                Set-Variable -Name childToken -Value (ConvertTo-SecureString $response.access_token -AsPlainText -Force) -Scope Script -Option ReadOnly -Force
            }
            else {
                Set-Variable -Name token -Value (ConvertTo-SecureString $response.access_token -AsPlainText -Force) -Scope Script -Option ReadOnly -Force
            }
        }
        default { Write-Host "Connection FAILED: "$response.message }
    }
}
