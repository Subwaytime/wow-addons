# Console Port

## [2.6.12](https://github.com/seblindfors/ConsolePort/tree/2.6.12) (2023-07-13)
[Full Changelog](https://github.com/seblindfors/ConsolePort/compare/2.6.11...2.6.12) [Previous Releases](https://github.com/seblindfors/ConsolePort/releases)

- Update ConsolePort.toc  
- Make radial intercept all sticks at all times  
    This is a bit of a nerf to utility rings, but necessary to keep them working properly in combat.  
- Add workaround for left click emulation/binding race condition  
    Changing propagation in combat is probably not going to work going forward. This workaround addresses an old issue where left mouse button is trying to be both a button and an emulation key at the same time. Adding a brief window of time to change state solves the issue.  
- Add clear button to config widgets  
- Add workaround for Classic Era config crash  
    This can be removed when Classic Hardcore is launched.  
