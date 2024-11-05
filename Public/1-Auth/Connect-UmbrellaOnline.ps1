#Makes the "Create Authorization Token" API call

function Connect-UmbrellaOnline {
    [CmdletBinding()]
    param (
        [ValidateNotNullOrEmpty()]
        [Parameter(ValueFromPipelineByPropertyName)]
        [int]$OrgId,
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

    if($null -ne $OrgId) {
        $headers = @{
            'X-Umbrella-OrgId' = $OrgId
        }
    }

    $response = Invoke-RestMethod -Uri $UmbrellaAPIPaths.Auth.TokenUrl -Authentication Basic -Method "POST" -Credential $creds -StatusCodeVariable responseStatus -SkipHttpErrorCheck -Headers $headers
    
    switch ($responseStatus) {
        200 {
            Write-Host "Now connected to Umbrella API"
            Set-Variable -Name token -Value (ConvertTo-SecureString $response.access_token -AsPlainText -Force) -Scope Script -Option ReadOnly -Force
        }
        default {Write-Host "Connection FAILED: "$response.message}
    }
}
