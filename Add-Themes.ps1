@(
    # Stable
    "$HOME/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState", 

    # Preview
    "$HOME/AppData/Local/Packages/Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe/LocalState",

    # Canary
    "$HOME/AppData/Local/Packages/Microsoft.WindowsTerminalCanary_8wekyb3d8bbwe/LocalState"
) | ForEach-Object {
    $terminalDir = "$_"
    $terminalProfile = "$terminalDir/settings.json"

    # This version of windows terminal isn't installed
    if (!(Test-Path -Path $terminalProfile)) {
        return
    }

    Copy-Item -Path $terminalProfile -Destination "$terminalDir/settings.json.bak"

    # Load existing profile
    $configData = (Get-Content -Path $terminalProfile | ConvertFrom-Json) | Where-Object { $_ -ne $null }

    $newThemes = $(Get-Content './allthemes.json' | ConvertFrom-Json)
    $names = $newThemes | ForEach-Object { $_.name }

    # Create a new list to store schemes
    $schemes = New-Object Collections.Generic.List[Object]

    $configData.schemes | Where-Object { -not $names.Contains($_.name) } | ForEach-Object { $schemes.Add($_) }
    $newThemes | ForEach-Object { $schemes.Add($_) }

    # Update color schemes
    $configData.schemes = $schemes

    # Write config to disk
    $configData | ConvertTo-Json -Depth 32 | Set-Content -Path $terminalProfile
}