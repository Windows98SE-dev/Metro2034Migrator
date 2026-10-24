# Metro Last Light Redux Save Migration Tool

## What does it do ?
- Looks for your game directory
- Copies the save data

## Why ?
Because the Linux native build of Metro Last Light and Metro 2033 have been abandoned and have several major issues

- Not XDG compliant
- No Wayland support out of the box
- No updates
- Broken Steam Cloud

## How to use ?
```bash
chmod +x backup.sh # If necessary
bash backup.sh
```

## TODO
- Add resotre save into Proton
