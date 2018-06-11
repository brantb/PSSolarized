# Solarized

A PowerShell module defining colors from Ethan Schoonover's excellent [Solarized color scheme][solarized].

The heavy lifting of creating ANSI escape sequences is done by [Pansies][pansies].

[solarized]: https://ethanschoonover.com/solarized
[pansies]: https://github.com/PoshCode/Pansies

## Installing

```powershell
Install-Module Solarized
Get-SolarizedPalette
```

## Usage

Two cmdlets are provided.

-   `Get-SolarizedPalette` returns a `PSCustomObject` with the entire palette.
-   `Get-SolarizedColor` returns a single color as a `PoshCode.Pansies.RgbColor` object.

These can be used with the enhanced `Write-Host` cmdlet from Pansies:

```powershell
$fg = Get-SolarizedColor foreground
$bg = Get-SolarizedColor background
"Hello, world!" | Write-Host -ForegroundColor $fg -BackgroundColor $bg
```

Or using [PowerLine] to customize your prompt:

```powershell
Add-PowerLineBlock {
    Get-ShortenedPath -RelativeToHome | New-PromptText -Bg (Get-SolarizedColor bg -Highlight) -Fg (Get-SolarizedColor fg -Highlight)
}
```

[powerline]: https://github.com/Jaykul/PowerLine

## Other Solarized-related PowerShell projects

-   [cmd-colors-solarized](https://github.com/neilpa/cmd-colors-solarized)
