function Disconnect-UmbrellaOnline {
    Remove-Variable -Name token -Scope Script -Force -Confirm:$false -ErrorAction Stop
}
