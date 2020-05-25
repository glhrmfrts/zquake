// z_client.qc - Manages clients respawning/spectating

// ZClientSpectate - Start spectating another alive player
// or cycle through them if already spectating
void() ZClientSpectate =
{
    local entity whospec = world;
    while ((whospec = find(whospec, classname, "player")))
    {
        if (whospec.health > 0 && whospec != self && whospec != self.clientcamera)
        {
            self.clientcamera = whospec;
            centerprint(self, strcat("Spectating ", whospec.netname));
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
        self.zspectator = 1;
        ZClientSpectate();
        return FALSE;
    }

    self.zspectator = 0;
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
};