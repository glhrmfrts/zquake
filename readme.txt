==============================================================================

Title        : ZQuake Alpha v0.0.1
Date         : 4th May 2020
MOD Team     : Guilherme Nemeth - Code and Level Design

Description  : This is a wave-based survival gameplay mod, it supports single player
             : and coop mode. It's heavily inspired by CoD: Black Ops II zombie mode.
			 
AD           : This mod is based on AD (Arcane Dimensions) due to it's wide array
             : of monsters and other various features. Huge thanks to AD authors
             : for creating such an amazing mod.

QC           : All the QC files are included and covered under GPL.
			 
Additional   : The majority of the textures are based on existing Quake assets
Compilers &  : BSP/VIS Compilers - by Kevin Shanahan/Eric Wasylishen
Dev tools    : Latest Version - ericwa.github.io/tyrutils-ericw/
             : Quake C FTEQCC Compiler (fte.triptohell.info/)

Engines      : The MOD is designed to work with the FTEQW engine
               Other engines offer partial support of features

* FTEQW      : Version 5647 (Must use the latest version)
    - Download (http://fte.triptohell.info/)

To mappers   : If you want to make levels for ZQuake (please do) the FGD
               file contains all the entities necessary to do so, this is
               is a brief explanation how the entities are setup:

               First, there are the concept of monster classes, classified as:

               - Zombie
               - Weak 1, Weak 2
               - Mid 1, Mid 2
               - Boss 1, Boss 2

               Each monster class apart from Zombie starts spawning at a certain wave,
               and this is totally configurable by the 'info_wavemgr' entity.

               - info_wavemgr -> Instead of patching worldspawn with custom
               fields, I decided to create a new entity to manage ZQuake parameters, like
               monster start waves and range of quantity of monsters and what not.
               The 'count' field is the start wave of the level, it defaults to '1',
               but you may want to change that for debugging purposes.

               The 'Weak 2 afraid of Weak 1' spawnflag controls whether monsters of the
               'Weak 2' class will spawn less when 'Weak 1' monsters are around. I wanted
               to have less spiders when dogs are around, hence this flag.

               There are also fields for configuring the monster count of each class. These are:

               - 'weak1_mincount/weak1_maxcount'
               - 'weak2_mincount/weak2_maxcount'
               - 'mid1_mincount/mid1_maxcount'
               - and so on...

               - info_monster_flags -> This is another entity used to configure which monsters
               are enabled for each class. I only used a separate entity to be able to use
               the .spawnflags field and get the nice Trenchbroom checkbox UI, since it
               doesn't work with other fields. The flags are described in the FGD file.

               - info_monster_spawn -> This entity is placed where you want monsters to spawn,
               the 'radius' field specify how far they will be randomly placed from this entity's origin.
               The 'spawnflags' field configures which monster class is disabled for this specific
               spawn point. And if the 'weak2_mincount' field is set, this spawn point will
               always spawn 'weak2_mincount * current_wave' amount of weak2 monsters, ignoring
               the limits specified in the 'info_wavemgr' entity.

               - info_buy_item -> When used, this entity will 'buy' an item for the player, given
               that they have enough credits. More info on the FGD file.

               - trigger_shop_area -> Trigger brush entity used to display info and price of
               the info_buy_item targeted by the 'target' field.

               If you need help, you can reach me at guilherme.nemeth at gmail dot com, or
               search for me in the Quake Mapping discord, my username is 'glhrmfrts'.
               You can also open a new issue in the Github repo, not just for help but if
               you have ideas or a feature request, you can post there.

               Also feel free to fork this and contribute with pull requests (given that the
               project stays focused in the wave-based survival aspect), or make
               your own thing based on this. The Mod is covered by the GPL license.

================================================================================