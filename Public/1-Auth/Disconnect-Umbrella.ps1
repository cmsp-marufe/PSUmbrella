function Disconnect-Umbrella {
    Remove-Variable -Name Token -Scope Global -Force -Confirm:$false -ErrorAction Stop
}
