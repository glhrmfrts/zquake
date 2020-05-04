void() wavemgr_next_wave;

void() EndWaveCheat =
{
    g_force_wave_end = 1;
    local entity zomb = world;
    while ((zomb = findfloat(zomb, zmonster, TRUE)))
    {
        remove(zomb);
    }
};

void() SetupWave =
{
    // Zombies generation
    g_zombies_to_spawn = floor(RandomBetween(self.zombie_mincount + (1*g_current_wave), self.zombie_maxcount + (2*g_current_wave)));

    // Dogs generation
    g_weak1_to_spawn = 0;
    if (g_current_wave >= WEAK1_START_WAVE)
    {
        if (random() > 0.25 || g_current_wave == WEAK1_START_WAVE)
        {
            g_weak1_to_spawn = floor(RandomBetween(self.weak1_mincount + (0.5*(g_current_wave - WEAK1_START_WAVE)), self.weak1_maxcount + (1*(g_current_wave - WEAK1_START_WAVE))));
        }
        else
        {
            g_weak1_to_spawn = 0;
        }
    }

    // Spiders generation
    g_weak2_to_spawn = 0;
    if (g_current_wave >= WEAK2_START_WAVE)
    {
        if ((g_weak1_to_spawn <= WEAK2_START_WAVE) || !(self.spawnflags & WAVEMGR_WEAK2_AFRAID))
        {
            g_weak2_to_spawn = floor(RandomBetween(self.weak2_mincount + (0.5*(g_current_wave - WEAK2_START_WAVE)), self.weak2_maxcount + (1*(g_current_wave - WEAK2_START_WAVE))));
        }
        else
        {
            g_weak2_to_spawn = floor(self.weak2_mincount*0.35);
        }
    }

    // Knights generation
    g_mid1_to_spawn = 0;
    if (g_current_wave >= MID1_START_WAVE)
    {
        if (random() > 0.05)
        {
            g_mid1_to_spawn = floor(RandomBetween(self.mid1_mincount + (0.5*(g_current_wave - MID1_START_WAVE)), self.mid1_maxcount + (1*(g_current_wave - MID1_START_WAVE))));
        }
        else
        {
            g_mid1_to_spawn = self.mid1_mincount + (1*(g_current_wave - MID1_START_WAVE));
        }
    }

    // Boils generation
    g_mid2_to_spawn = 0;
    if (g_current_wave >= MID2_START_WAVE)
    {
        if (random() > 0.25 || g_current_wave == MID2_START_WAVE)
        {
            g_mid2_to_spawn = floor(RandomBetween(self.mid2_mincount + (0.5*(g_current_wave - MID2_START_WAVE)), self.mid2_maxcount + (1*(g_current_wave - MID2_START_WAVE))));
        }
        else
        {
            g_mid2_to_spawn = 0;
        }
    }

    // Demons generation
    g_boss1_to_spawn = 0;
    if (g_current_wave >= BOSS1_START_WAVE)
    {
        if (random() > 0.2)
        {
            g_boss1_to_spawn = floor(RandomBetween(self.boss1_mincount + (0.25*(g_current_wave - BOSS1_START_WAVE)), self.boss1_maxcount + (0.5*(g_current_wave - BOSS1_START_WAVE))));
        }
        else
        {
            g_boss1_to_spawn = self.boss1_mincount;
        }
    }

    // Tarbaby generation
    g_boss2_to_spawn = 0;
    if (g_current_wave >= BOSS2_START_WAVE)
    {
        if (random() > 0.5)
        {
            g_boss2_to_spawn = floor(RandomBetween(self.boss2_mincount + (0.25*(g_current_wave - BOSS2_START_WAVE)), self.boss2_maxcount + (0.5*(g_current_wave - BOSS2_START_WAVE))));
        }
    }
};

void() SetupBossWave =
{
    g_weak1_to_spawn = 0;
    g_weak2_to_spawn = 0;
    g_zombies_to_spawn = 0;
    g_mid1_to_spawn = 0;
    g_mid2_to_spawn = 0;
    g_boss1_to_spawn = 0;
    g_boss2_to_spawn = 0;

    if (g_current_wave == BOSS1_START_WAVE)
    {
        g_boss1_to_spawn = self.boss1_maxcount * 2;
        g_boss_delay_time = time + 10.0;
    }
    else if (g_current_wave == BOSS2_START_WAVE)
    {
        g_boss2_to_spawn = self.boss2_maxcount * 2;
        g_boss_delay_time = time + 10.0;
    }
    else if (g_current_wave == 20)
    {
        g_boss1_to_spawn = floor(self.boss1_maxcount * 2.5);
        g_boss2_to_spawn = floor(self.boss2_maxcount * 2.5);
        //g_boss_delay_time = time + 10.0;
        g_prior1 = ZMONSTER_BOSS2;
        g_prior2 = ZMONSTER_BOSS1;
        g_use_prior = TRUE;
        g_cur_prior = 0;
    }
};

void() SetupZombieWave =
{
    g_weak1_to_spawn = 0;
    g_weak2_to_spawn = 0;
    g_zombies_to_spawn = 0;
    g_mid1_to_spawn = 0;
    g_mid2_to_spawn = 0;
    g_boss1_to_spawn = 0;
    g_boss2_to_spawn = 0;

    g_zombies_to_spawn = floor(RandomBetween(self.zombie_mincount + (1*g_current_wave), self.zombie_maxcount + (2*g_current_wave)));
    g_zombies_to_spawn *= floor(RandomBetween(0.25 * (g_current_wave * 0.5), 0.4 * (g_current_wave * 0.5)));

    g_monster_mintime *= floor(RandomBetween(0.5, 0.8));
    g_monster_maxtime *= floor(RandomBetween(0.5, 0.8));
};

void() WaveChanged =
{
    local float lastwave = g_wave_type;

    // Decide which type of wave we are gonna have
    g_wave_type = WAVE_DEFAULT;
    if (g_current_wave == 10 || g_current_wave == 15 || g_current_wave == 20) {
        g_wave_type = WAVE_BOSS;
    }
    else if (g_current_wave > 10 && lastwave != WAVE_ZOMBIE && (random() < 0.5)) {
        g_wave_type = WAVE_ZOMBIE;
    }

    // Setup monster spawning time
    g_monster_mintime = self.monster_mintime - (0.5 * g_current_wave * RandomBetween(0.5, 1.5));
    g_monster_maxtime = self.monster_maxtime - (0.3 * g_current_wave * RandomBetween(0.5, 1.5));

    // Reset priority state
    g_prior1 = 0;
    g_prior2 = 0;
    g_use_prior = FALSE;
    g_cur_prior = 0;
    g_boss_delay_time = 0.0;

    // Setup the wave accordingly
    if (g_wave_type == WAVE_BOSS)
        SetupBossWave();
    else if (g_wave_type == WAVE_ZOMBIE)
        SetupZombieWave();
    else
        SetupWave();

    g_zombie_health = floor(self.zombie_health + (4 * g_current_wave));

    g_zombies_spawned = 0;
    g_weak1_spawned = 0;
    g_mid1_spawned = 0;
    g_mid2_spawned = 0;
    g_boss1_spawned = 0;
    g_weak2_spawned = 0;
    g_boss2_spawned = 0;
    g_monsters_spawned = 0;

    g_zombies_killed = 0;
    g_weak1_killed = 0;
    g_mid1_killed = 0;
    g_mid2_killed = 0;
    g_boss1_killed = 0;
    g_weak2_killed = 0;
    g_boss2_killed = 0;
    g_monsters_killed = 0;

    // Tweak monster count based on skill
    local float sk = max(skill, 0.5);
    g_zombies_to_spawn = floor(g_zombies_to_spawn * sk);
    g_weak1_to_spawn = floor(g_weak1_to_spawn * sk);
    g_weak2_to_spawn = floor(g_weak2_to_spawn * sk);
    g_mid1_to_spawn = floor(g_mid1_to_spawn * sk);
    g_mid2_to_spawn = floor(g_mid2_to_spawn * sk);
    g_boss1_to_spawn = floor(g_boss1_to_spawn * sk);
    g_boss2_to_spawn = floor(g_boss2_to_spawn * sk);

    // Tweak monster count based on number of players
    if (coop && g_num_players > 1)
    {
        g_zombies_to_spawn += floor(self.zombie_mincount * g_current_wave * 0.25 * g_num_players);
        g_weak1_to_spawn += floor(self.weak1_mincount * g_current_wave * 0.25 * g_num_players);
        g_weak2_to_spawn += floor(self.weak2_mincount * g_current_wave * 0.25 * g_num_players);
        g_mid1_to_spawn += floor(self.mid1_mincount * g_current_wave * 0.25 * g_num_players);
        g_mid2_to_spawn += floor(self.mid2_mincount * g_current_wave * 0.25 * g_num_players);
        g_boss1_to_spawn += floor(self.boss1_mincount * g_current_wave * 0.25 * g_num_players);
        g_boss2_to_spawn += floor(self.boss2_mincount * g_current_wave * 0.25 * g_num_players);
    }

    g_monsters_to_spawn = (
        g_zombies_to_spawn + g_weak1_to_spawn + g_boss1_to_spawn + g_mid1_to_spawn + g_weak2_to_spawn + g_mid2_to_spawn + g_boss2_to_spawn
    );

    g_force_wave_end = 0;

    if (g_monster_mintime < 1.0) g_monster_mintime = 1.0;
    if (g_monster_maxtime < 3.0) g_monster_maxtime = 3.0;

    dprint("will spawn ");dprint(ftos(g_zombies_to_spawn));dprint(" zombies\n");
    dprint("will spawn ");dprint(ftos(g_weak1_to_spawn));dprint(" dogs\n");
    dprint("will spawn ");dprint(ftos(g_weak2_to_spawn));dprint(" spiders\n");
    dprint("will spawn ");dprint(ftos(g_mid2_to_spawn));dprint(" boils\n");
    dprint("will spawn ");dprint(ftos(g_mid1_to_spawn));dprint(" knights\n");
    dprint("will spawn ");dprint(ftos(g_boss1_to_spawn));dprint(" demons\n");
};

void() wavemgr_end_wave =
{
    g_wave_active = 0;
    CenterPrintAll("Wave completed!\n");

    self.attack_finished = 0;
    self.think = wavemgr_next_wave;
    self.nextthink = time + 3.0;
};

void() wavemgr_think =
{
    if (g_force_wave_end)
    {
        g_force_wave_end = 0;
        wavemgr_end_wave();
        return;
    }

    g_num_players = 0;
    local float num_players_alive = 0;
    local entity p = world;
    while ((p = find(p, classname, "player")))
    {
        if (p.health > 0)
        {
            num_players_alive = 1;
            g_num_players = g_num_players + 1;
            break;
        }
    }
    if (!num_players_alive)
        localcmd("restart\n");

    self.nextthink = time + 1.0;

    if (!g_wave_active) return;
    if (g_monsters_spawned < g_monsters_to_spawn) return;

    local float mondiff = g_monsters_spawned - g_monsters_killed;
    if ((mondiff <= 3) && (time - g_monster_killed_time <= 3) && self.attack_finished <= time)
    {
        CenterPrintAll(strcat("Only ", ftos(mondiff), " more to go...\n"));
        self.attack_finished = time + 3.0;
    }

    local float num_zombies = 0;
    local entity zomb = world;
    while ((zomb = findfloat(zomb, zmonster, TRUE)))
    {
        if (zomb.health > 0.0)
        {
            num_zombies = 1;
            break;
        }
    }

    if (!num_zombies)
        wavemgr_end_wave();
};

void() wavemgr_countdown =
{
    if (self.wait)
    {
        // print and loop
        CenterPrintAll(strcat("Next wave in ", ftos(self.wait), " seconds...\n"));
        self.wait = self.wait - 1;
        self.think = wavemgr_countdown;
        self.nextthink = time + 1.0;
        return;
    }

    // advance to next wave
    g_current_wave = g_current_wave + 1;
    g_wave_active = 1;
    WaveChanged();

    self.think = wavemgr_think;
    self.nextthink = time + 1.0;
};

void() wavemgr_next_wave =
{
    // Give everyone bonus for finishing wave
    local entity player = world;
    while ((player = find(player, classname, "player")))
    {
        GiveCredits(player, 10 + (2 * (g_current_wave - 1)));
    }

    self.wait = 5;
    self.think = wavemgr_countdown;
    self.nextthink = time + 0.1;
};

void() wavemgr_start =
{
    g_wave_active = 0;
    g_current_wave = self.count - 1;

    self.wait = 5;
    self.think = wavemgr_countdown;
    self.nextthink = time + 0.1;
};

/*QUAKED info_wavemgr
Entity that manages the waves advancing
-------- KEYS --------
count    : Start wave number
-------- NOTES --------
Entity that manages the waves advancing
*/
void() info_wavemgr =
{
    clientstat(STAT_WAVENUM, EV_FLOAT, wavenum);
    clientstat(STAT_CREDIT, EV_FLOAT, credit);
    clientstat(STAT_CREDITDIFF, EV_FLOAT, creditdiff);
    clientstat(STAT_WAVEACTIVE, EV_FLOAT, waveactive);

    self.solid = SOLID_NOT;
    self.movetype = MOVETYPE_NONE;
    self.think = wavemgr_start;
    self.nextthink = time + 1.0;

    if (!self.count) self.count = 1;
    if (!self.zombie_health) self.zombie_health = BASE_ZOMBIE_HEALTH;
    if (!self.monster_mintime) self.monster_mintime = BASE_ZOMBIE_MINTIME;
    if (!self.monster_maxtime) self.monster_maxtime = BASE_ZOMBIE_MAXTIME;
    if (!self.zombie_mincount) self.zombie_mincount = BASE_ZOMBIE_MINCOUNT;
    if (!self.zombie_maxcount) self.zombie_maxcount = BASE_ZOMBIE_MAXCOUNT;
    if (!self.weak1_mincount) self.weak1_mincount = BASE_WEAK1_MINCOUNT;
    if (!self.weak1_maxcount) self.weak1_maxcount = BASE_WEAK1_MAXCOUNT;
    if (!self.weak2_mincount) self.weak2_mincount = BASE_WEAK2_MINCOUNT;
    if (!self.weak2_maxcount) self.weak2_maxcount = BASE_WEAK2_MAXCOUNT;
    if (!self.mid2_mincount) self.mid2_mincount = BASE_MID2_MINCOUNT;
    if (!self.mid2_maxcount) self.mid2_maxcount = BASE_MID2_MAXCOUNT;
    if (!self.mid1_mincount) self.mid1_mincount = BASE_MID1_MINCOUNT;
    if (!self.mid1_maxcount) self.mid1_maxcount = BASE_MID1_MAXCOUNT;
    if (!self.boss1_mincount) self.boss1_mincount = BASE_BOSS1_MINCOUNT;
    if (!self.boss1_maxcount) self.boss1_maxcount = BASE_BOSS1_MAXCOUNT;
    if (!self.boss2_mincount) self.boss2_mincount = BASE_BOSS2_MINCOUNT;
    if (!self.boss2_maxcount) self.boss2_maxcount = BASE_BOSS2_MAXCOUNT;
};


void() info_monster_flags =
{
    g_monster_flags = self.spawnflags;
    self.solid = SOLID_NOT;
    self.movetype = MOVETYPE_NONE;
};