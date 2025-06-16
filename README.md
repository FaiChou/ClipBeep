# ClipBeep

ClipBeep is a macOS application that plays a beep sound when the clipboard is changed.

## Download

```
mkdir -p ~/bin
curl -L -o ~/bin/ClipBeep https://github.com/FaiChou/ClipBeep/releases/download/v1.0/ClipBeep
```

## Setup

```
chmod +x ~/bin/ClipBeep
mkdir -p ~/Library/LaunchAgents
cat > ~/Library/LaunchAgents/com.faichou.clipbeep.plist << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
 "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.faichou.clipbeep</string>
    <key>ProgramArguments</key>
    <array>
        <string>${HOME}/bin/ClipBeep</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
</dict>
</plist>
EOF
```

## Run

```
launchctl load ~/Library/LaunchAgents/com.faichou.clipbeep.plist
```

## Uninstall

```
launchctl unload ~/Library/LaunchAgents/com.faichou.clipbeep.plist
rm ~/Library/LaunchAgents/com.faichou.clipbeep.plist
rm ~/bin/ClipBeep
```
