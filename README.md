Speedster
=========
Faster iOS animation.\
An iOS extention(Tweak) that increases iOS animation speed.\
Support iOS and iPadOS from 13 to 16 (newer might still be supported)

[<img src="https://github.com/Hoangdus/Speedster/blob/main/havoc_get_square.png" alt="drawing" width="500"/>](https://havoc.app/package/speedster)

Function
========
- Speed up app open and close animation.
- Speed up in-app animation.
- Speed up folder open and close animation.
- Add bounce to app open, close and switcher animation.
- Adjust how fast the screen turn on and off.
- Disable icons fly in when unlock.
- Disable icons jitter when editing.
- Disable folder open and close animation
- Disable icons and wallpaper zoom out when enter switcher.

Building
========
You need to have [Theos](https://theos.dev/) installed and configured

Build for rootful
```
make package
```

Build for rootless
```
make package THEOS_PACKAGE_SCHEME=rootless
```

License 
=======
Speedster is licensed under [GPLv3](https://www.gnu.org/licenses/gpl-3.0.en.html)
