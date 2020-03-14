# base16-windows-terminal
This is a repository for the Base16 themes for [Windows Terminal](https://github.com/microsoft/terminal) by using the template architecture outlined in https://github.com/chriskempson/base16.

## The Windows Terminal settings file

Since Windows Terminal uses an array of themes as JSON objects within its settings file, a helper script `Combine-Templates.ps1` that generates said array is included in this repository.

Running this command with a single command line argument pointing to the folder `windows-terminal` with the built themes will generate a file `allthemes.json` in the script home directory. The entire contents of this file can be directly pasted into the `schemes` section of the Windows Terminal settings file to include all generated Base16 themes at once. For convenience, such an output file is also included in this repository although it may not be up-to-date with the very latest Base16 themes.

## Applying a color theme

Set the key `colorScheme` in either your Windows Terminal profile of choice or the defaults section to the theme name, e.g.

```json
{
    "$schema": "https://aka.ms/terminal-profiles-schema",
    "defaultProfile": "{574e775e-4f2a-5b96-ac1e-a2962a402336}",
    "profiles": {
        "defaults": {
            // Use the Base16 Tomorrow Night theme.
            "colorScheme": "Base16 Tomorrow Night"
        },
        "list": [
            {
                "guid": "{574e775e-4f2a-5b96-ac1e-a2962a402336}",
                "hidden": false,
                "name": "PowerShell",
                "source": "Windows.Terminal.PowershellCore"
            }
        ],
        "schemes": [
            // The themes go here.
        ]
    }
}
```