$data = $null
Get-ChildItem -Path "$($args[0])\*.json" -Exclude allthemes.json | ForEach-Object { $data = @($data; Get-Content $_ -Raw | ConvertFrom-Json) }
$data | Select-Object -Skip 1 | ConvertTo-Json | Out-File allthemes.json
