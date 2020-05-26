// z_client.qc - Manages clients respawning/spectating

// ZClientSpectate - Start spectating another alive player
// or cycle through them if already spectating
void() ZClientSpectate =
{
    if (g_num_players < 2) return;

    if (self.zspecentity == world)
    {
        // first time spectating after dying
        CopyToBodyQue(self);

        // Switch on notarget so monsters don't attack player
		// Add god mode to prevent any damage, is reset on map change
		self.flags = self.flags + (FL_NOTARGET || FL_GODMODE);
		self.flags = self.flags - (self.flags & FL_ONGROUND);
	
		// reset player model to nothing and no world interaction
		self.velocity = self.avelocity = '0 0 0';
		self.solid = SOLID_NOT;
		self.movetype = MOVETYPE_NONE;		// no more movement
		self.takedamage = DAMAGE_NO;		// no more damage
		setmodel(self, MODEL_EMPTY);		// Hide player model
		setsize(self, VEC_ORIGIN, VEC_ORIGIN);
		self.weaponmodel = string_null;		// No vmodel updates
		self.frame = self.weaponframe = 0;	// reset all frames
		self.waitmin = time + 0.5;			// Delay before start
		self.think = SUB_Null;	            // Stop player.qc
        self.health = 0;                    // only way to fix tilted death camera
    }

    local entity whospec = world;
    while ((whospec = find(whospec, classname, "player")))
    {
        if (whospec.health > 0 && whospec != self && whospec != self.zspecentity)
        {
            self.zspecentity = whospec;
            //msg_entity = self;
            //WriteByte(MSG_ALL, SVC_SETVIEW);
            //WriteEntity(MSG_ALL, whospec);
            centerprint(self, strcat("Spectating ", whospec.netname, "\n"));
            break;
        }
    }
};

void() ZClientConnect =
{
    self.credit = 0;

    // Give some beginning credit if starting from advanced waves
    if (g_current_wave >= 15)
    {
        GiveCredits(self, 300);
    }
    else if (g_current_wave >= 10)
    {
        GiveCredits(self, 200);
    }
    else if (g_current_wave >= 7)
    {
        GiveCredits(self, 75);
    }
    else if (g_current_wave >= 5)
    {
        GiveCredits(self, 50);
    }
};

float() ZCanClientRespawn =
{
    if (g_wave_active)
    {
        ZClientSpectate();
        return FALSE;
    }

    if (self.zspecentity == world)
    {
        // player never spectated, so copy the body
        CopyToBodyQue(self);
    }

    self.zspecentity = world;
    self.clientcamera = self;
    return TRUE;
};

void() ZClientRespawn =
{
};

void() ZPlayerPreThink =
{
    self.wavenum = g_current_wave;
    self.waveactive = g_wave_active;

    // Clear creditdiff
    if (self.creditdifftime < time)
    {
        self.creditdiff = 0;
    }

    if (self.zspecentity != world)
    {
        // player is spectating another player
        self.view_ofs = '0 0 22';
        makevectors(self.zspecentity.angles);
        setorigin(self, self.zspecentity.origin - v_forward*50.0 + v_up*20.0);
        self.angles = self.zspecentity.angles;
        self.angles_x = 0;
        self.fixangle = TRUE;
    }
};