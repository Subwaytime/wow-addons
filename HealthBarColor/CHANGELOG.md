# HealthBarColor

## [v10.1.5-2.5.0](https://github.com/Slothpala/HealthBarColor/tree/v10.1.5-2.5.0) (2023-08-03)
[Full Changelog](https://github.com/Slothpala/HealthBarColor/compare/v10.1.5-2.4.0...v10.1.5-2.5.0) 

- fixed EmptyTables() settings should apply immediately again  
- tex coords for normal frame texture adjustet  
- adjusted texture coords  
- added hooked[ressourcebar] = true to prevent/rehook/StackOverflow  
- desc field added for Overabsorb module  
- OptionsFrame is now only movable by clicking on the titlebar  
-  @Non-debug@ added to prevent mssing file error  
- OptionalDeps added for standalone libs  
- target & focus added  
    OnDisable() function created  
- Absorb width now correctly calculated  
- removed UnitFrame\_Update hook and added function to reanchor the glow outside of the hook  
- new meta function added for absorb variables  
- Overabsorb module added  
- removed hooks in module and added functions to register callbacks in core  
- Cleaned up code  
    added functions for modules to register for ToPlayer/VehicleArt  
