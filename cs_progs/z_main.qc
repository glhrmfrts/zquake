

void(float apilevel, string enginename, float engineversion) CSQC_Init =
{	//note: the three arguments are engine-defined, and can be used to to detect if the engine version you're running in has bugs. Just call error("please update your engine") if it's got known fatal bugs, but try not to exclude engines you've not tested against (ie: forks where your code will otherwise work fine).
	//foo = spawn();//local entity foo = spawn();
	//precache_model("progs/player.mdl");	//or something else
	//setmodel(foo, "progs/player.mdl");	//same as ssqc, see, its easy!
	//setorigin(foo, '544 496 40');		//you'll need to fix the origin to ensure you don't put it in a wall...
	//foo.drawmask = MASK_ENGINE;		//cause the entity to be added to the scene automatically via the addentities(MASK_ENGINE) builtin.
	//foo.think = soundPlayer;
	//foo.nextthink = time + 0.1;
};

void(float width, float height, float menushown) CSQC_UpdateView =
{
    vid_conwidth = width;
    vid_conheight = height;

	clearscene();					//wipe entity lists. reset view properties to their defaults.
	setviewprop(VF_DRAWENGINESBAR, 1);		//draw a status bar (or hud or whatever the engine normally does) around the screen.
	setviewprop(VF_DRAWCROSSHAIR, 1);		//draw a crosshair in the middle of the screen.
	//setviewprop(VF_ORIGIN, '0 0 0');		//view position of the scene (after view_ofs effects).
	//setviewprop(VF_ANGLES, '0 0 0');		//override the view angles. input will work as normal. other players will see your player as normal. your screen will just be pointing a different direction.
	//setviewprop(VF_DRAWWORLD, 1);			//whether the world entity should be drawn. set to 0 if you want a completely empty scene.
	//setviewprop(VF_MIN, '0 0 0');			//top-left coord (x,y) of the scene viewport in virtual pixels (or annoying physical pixels in dp).
	//setviewprop(VF_SIZE, [width, height, 0]);	//virtual size (width,height) of the scene viewport in virtual pixels (or annoying physical pixels in dp).
	//setviewprop(VF_AFOV, cvar("fov"));		//note: fov_x and fov_y control individual axis. afov is general
	//setviewprop(VF_PERSPECTIVE, 1);		//1 means like quake and other 3d games. 0 means isometric.
	addentities((intermission?0:MASK_VIEWMODEL)|MASK_ENGINE);	//add various entities to the scene's lists.
	renderscene();					//draw the scene to the screen using the various properties.
    ZHud_Draw();
};

float( float evtype, float scanx, float chary, float devid ) CSQC_InputEvent =
{
	return FALSE;
}

float( string strCommand ) CSQC_ConsoleCommand =
{
    return FALSE;
};

void() CSQC_Ent_Remove =
{
};

void() CSQC_Shutdown =
{
};