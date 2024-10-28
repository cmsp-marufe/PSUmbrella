function Disconnect-Umbrella {
    Remove-Variable -Name Token -Scope Script -Force -Confirm:$false -ErrorAction Stop
    Write-Host "Umbrella API disconnected"
}
