#Get script files
$Public = @(Get-ChildItem -Path "$PSScriptRoot\Public\" -Filter "*.ps1" -Recurse -ErrorAction SilentlyContinue)
$Private = @(Get-ChildItem -Path "$PSScriptRoot\Private\" -Filter "*.ps1" -Recurse -ErrorAction SilentlyContinue)
$Dev = @(Get-ChildItem -Path "$PSScriptRoot\Dev\" -Filter "*.ps1" -Recurse -ErrorAction SilentlyContinue)
#Dot source script files

ForEach ($file in @($Public + $Private + $Dev)) {
    Try {
        . $file.fullname
    }
    Catch {
        Write-Error -Message "Failed to import function $($file.fullname): $_"
    }
}