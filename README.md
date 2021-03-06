# factorio-modding
Factorio mods and modding tools authored by Owen Durni.

## Mod list

*  `fire-armor` - This is just a copy of the [modding
   tutorial](https://wiki.factorio.com/Tutorial:Modding_tutorial/Gangsir) from the Factorio wiki.

## Dev notes

An attempt to keep track of everything I learn while working on this.

### Environment

#### Editor
Currently using VSCode on Windows. This is simply because Factorio is installed on my Windows
machine. I make no claims this is the best dev environment.

I have the following extensions installed:

*   `github.vscode-pull-request-github` - Integration with github including authentication.
*   `stkb.rewrap` - Automatically reflows text and comments to line length. (Alt+Q)
*   `trixnz.vscode-lua` - IDE features for lua.

##### Line length

I use a line length of 100 characters.

#### Filesystem configuration

To reduce iteration time, I define hard symlinks from the Factorio mods folder to my source code for
each mod. Example:

```
mklink /J "C:\Users\yaria\AppData\Roaming\Factorio\mods\fire-armor
```