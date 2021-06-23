# GMTK_Gamejam_21 - Chained escape

This game was originally made for GMTK Game Jam 2021 and the source code of the submission is saved in [GMTK_Game_Jam_21_final_ver.zip](https://github.com/markman4897/GMTK_Gamejam_21/blob/main/GMTK_Game_Jam_21_final_ver.zip) file.

The game is published and playable on [itch.io](https://markman4897.itch.io/chained-escape) but might not be the most recent version.

https://user-images.githubusercontent.com/8660220/121975965-2334ba00-cd83-11eb-9c43-94673d87fe81.mp4

## TODO:

### Fixes:

- why is the ball shaking instead of being a static body when in wall? (recheck for layer problems -.-) -- maybe thats fine cuz otherwise you cant move the ball when in wall? or maybe thats bad anyway?

- fix ball movement system so it doesn't glitch out on PC or phone

- figure out centering of text on button somehow (maybe the font is shit or something -..-)

### Tasks:

- make player spawn into level about 1s after it loads somehow
- Rework and learn gradients for chain links
- add sound effects (when trigger is entered/left, on victory, maybe for start/end of a movement)
- add animations for completing levels and entering them
- fix up the level display somehow...
- maybe make it so that you get to next level if you complete it
- lock levels until you complete one before it (test the web version!)
- more music, one for the menu, and more than one for different levels
- support multi touch? maybe no...
- support color theme switching somehow (reserch that) (maybe use "theme" yeah?)
  - figure out how to call color switch func on every item on screen somehow (maybe add them to a group or something)
  - figure out how to make the TileSet and Sprite things so you can change colors on the fly, maybe vector graphics instead or made with shapes within godot?

### Plans:

- rework and add more levels
- rework art
- make tilemap and spritesheet