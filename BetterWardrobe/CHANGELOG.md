# BetterWardrobe (@project-version@)

## [4.12](https://github.com/SLOKnightfall/BetterWardrobe/tree/4.12) (2023-09-17)
[Full Changelog](https://github.com/SLOKnightfall/BetterWardrobe/compare/4.11.6...4.12) [Previous Releases](https://github.com/SLOKnightfall/BetterWardrobe/releases)

- -Reworked the Patron list and removed the dependencies for Sushi since it was causing errors  
    -Reworked a bunch of the frames to hopefully reduce the taint issues.  After the updates I am no longer seeing taint issues related to the addon in the taint logs.  
    -Added a few in combat checks to reduce any combat related taint issues.  
