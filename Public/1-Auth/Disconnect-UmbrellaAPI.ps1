function Disconnect-UmbrellaAPI {
    Remove-Variable -Name Token -Scope Global -Force -Confirm:$false -ErrorAction Stop
}