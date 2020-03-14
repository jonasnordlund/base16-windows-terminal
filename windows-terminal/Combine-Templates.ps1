$data = $null
Get-ChildItem "$($args[0])\\*.json" -Exclude combined.json | ForEach-Object { $data = @($data; Get-Content $_ -Raw | ConvertFrom-Json) }
$data | Select-Object -Skip 1 | ConvertTo-Json | Out-File combined.json
