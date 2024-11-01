function Disconnect-Umbrella {
    Remove-Variable -Name token -Scope Script -Force -Confirm:$false -ErrorAction Stop
    Write-Host "Umbrella API disconnected"
}
