
void() ZClientConnect =
{
    self.credit = 0;

    // Give some beginning credit if starting from advanced waves
	local entity wavemgr = find(world, classname, "info_wavemgr");
    if (wavemgr.count >= 15)
    {
        GiveCredits(self, 300);
    }
    else if (wavemgr.count >= 10)
    {
        GiveCredits(self, 200);
    }
    else if (wavemgr.count >= 7)
    {
        GiveCredits(self, 75);
    }
    else if (wavemgr.count >= 5)
    {
        GiveCredits(self, 50);
    }
};

float() ZCanClientRespawn =
{
    if (g_wave_active) return FALSE;

    return TRUE;
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