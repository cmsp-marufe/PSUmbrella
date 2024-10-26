#Get script files
$Public = @(Get-ChildItem -Path "$PSScriptRoot\Public\" -Filter "*.ps1" -Recurse -ErrorAction SilentlyContinue)
$Private = @(Get-ChildItem -Path "$PSScriptRoot\Private\" -Filter "*.ps1" -Recurse -ErrorAction SilentlyContinue)

#Dot source script files

ForEach ($file in @($Public + $Private)) {
    Try {
        . $file.fullname
    }
    Catch {
        Write-Error -Message "Failed to import function $($file.fullname): $_"
    }
}

Export-ModuleMember -Function * -Variable *