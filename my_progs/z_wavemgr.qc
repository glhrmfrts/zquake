float g_force_wave_end;

.float zombie_health;
.float zombie_mintime;
.float zombie_maxtime;
.float zombie_mincount;
.float zombie_maxcount;
.float dog_mincount;
.float dog_maxcount;
.float spider_mincount;
.float spider_maxcount;
.float knight_mincount;
.float knight_maxcount;
.float demon_mincount;
.float demon_maxcount;

void() wavemgr_next_wave;

void() EndWaveCheat =
{
    g_force_wave_end = 1;
    local entity zomb = world;
    while ((zomb = find(zomb, classname, "monster_zumbi")))
    {
        remove(zomb);
    }
    while ((zomb = find(zomb, classname, "monster_zumbik")))
    {
        remove(zomb);
    }
    while ((zomb = find(zomb, classname, "monster_dog")))
    {
        remove(zomb);
    }
    while ((zomb = find(zomb, classname, "monster_spider")))
    {
        remove(zomb);
    }
    while ((zomb = find(zomb, classname, "monster_demon1")))
    {
        remove(zomb);
    }
    while ((zomb = find(zomb, classname, "monster_knight")))
    {
        remove(zomb);
    }
};

void() WaveChanged =
{
    // Dogs generation
    g_dogs_to_spawn = 0;
    if (g_current_wave >= 3)
    {
        if (random() > 0.25 || g_current_wave == 3)
        {
            g_dogs_to_spawn = floor(RandomBetween(self.dog_mincount + (0.5*(g_current_wave - 3)), self.dog_maxcount + (1*(g_current_wave - 3))));
        }
        else
        {
            g_dogs_to_spawn = 0;
        }
    }

    // Spiders generation
    g_spiders_to_spawn = 0;
    if (g_current_wave >= 4)
    {
        if (g_dogs_to_spawn <= 4)
        {
            g_spiders_to_spawn = floor(RandomBetween(self.spider_mincount + (0.5*(g_current_wave - 4)), self.spider_maxcount + (1*(g_current_wave - 4))));
        }
        else
        {
            g_spiders_to_spawn = floor(self.spider_mincount*0.35);
        }
    }

    // Knights generation
    g_knights_to_spawn = 0;
    if (g_current_wave >= 8)
    {
        if (random() > 0.05)
        {
            g_knights_to_spawn = floor(RandomBetween(self.knight_mincount + (0.5*(g_current_wave - 6)), self.knight_maxcount + (1*(g_current_wave - 6))));
        }
        else
        {
            g_knights_to_spawn = self.knight_mincount + (1*(g_current_wave - 6));
        }
    }

    // Demons generation
    g_demons_to_spawn = 0;
    if (g_current_wave >= 10)
    {
        if (random() > 0.2)
        {
            g_demons_to_spawn = floor(RandomBetween(self.demon_mincount + (0.25*(g_current_wave - 10)), self.demon_maxcount + (0.5*(g_current_wave - 10))));
        }
        else
        {
            g_demons_to_spawn = self.demon_mincount;
        }
    }

    // Zombies generation
    g_zombies_to_spawn = floor(RandomBetween(self.zombie_mincount + (1*g_current_wave), self.zombie_maxcount + (2*g_current_wave)));
    g_zombie_health = self.zombie_health + (6 * g_current_wave);
    g_zombie_mintime = self.zombie_mintime - (0.5 * g_current_wave * RandomBetween(0.5, 1.5));
    g_zombie_maxtime = self.zombie_maxtime - (0.3 * g_current_wave * RandomBetween(0.5, 1.5));

    g_zombies_spawned = 0;
    g_dogs_spawned = 0;
    g_knights_spawned = 0;
    g_demons_spawned = 0;
    g_spiders_spawned = 0;
    g_monsters_spawned = 0;

    g_zombies_killed = 0;
    g_dogs_killed = 0;
    g_knights_killed = 0;
    g_demons_killed = 0;
    g_spiders_killed = 0;
    g_monsters_killed = 0;

    g_monsters_to_spawn = g_zombies_to_spawn + g_dogs_to_spawn + g_demons_to_spawn + g_knights_to_spawn + g_spiders_to_spawn;

    g_force_wave_end = 0;

    if (g_zombie_mintime < 1.0) g_zombie_mintime = 1.0;
    if (g_zombie_maxtime < 3.0) g_zombie_maxtime = 3.0;
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

    g_monsters_killed = g_zombies_killed + g_dogs_killed + g_spiders_killed + g_knights_killed + g_demons_killed;

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
    while ((zomb = find(zomb, classname, "monster_zumbi")))
    {
        if (zomb.health > 0.0)
        {
            num_zombies = 1;
            break;
        }
    }
    while ((zomb = find(zomb, classname, "monster_zumbik")))
    {
        if (zomb.health > 0.0)
        {
            num_zombies = 1;
            break;
        }
    }
    while ((zomb = find(zomb, classname, "monster_dog")))
    {
        if (zomb.health > 0.0)
        {
            num_zombies = 1;
            break;
        }
    }
    while ((zomb = find(zomb, classname, "monster_spider")))
    {
        if (zomb.health > 0.0)
        {
            num_zombies = 1;
            break;
        }
    }
    while ((zomb = find(zomb, classname, "monster_demon1")))
    {
        if (zomb.health > 0.0)
        {
            num_zombies = 1;
            break;
        }
    }
    while ((zomb = find(zomb, classname, "monster_knight")))
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
    if (!self.zombie_mintime) self.zombie_mintime = BASE_ZOMBIE_MINTIME;
    if (!self.zombie_maxtime) self.zombie_maxtime = BASE_ZOMBIE_MAXTIME;
    if (!self.zombie_mincount) self.zombie_mincount = BASE_ZOMBIE_MINCOUNT;
    if (!self.zombie_maxcount) self.zombie_maxcount = BASE_ZOMBIE_MAXCOUNT;
    if (!self.dog_mincount) self.dog_mincount = BASE_DOG_MINCOUNT;
    if (!self.dog_maxcount) self.dog_maxcount = BASE_DOG_MAXCOUNT;
    if (!self.spider_mincount) self.spider_mincount = BASE_SPIDER_MINCOUNT;
    if (!self.spider_maxcount) self.spider_maxcount = BASE_SPIDER_MAXCOUNT;
    if (!self.knight_mincount) self.knight_mincount = BASE_KNIGHT_MINCOUNT;
    if (!self.knight_maxcount) self.knight_maxcount = BASE_KNIGHT_MAXCOUNT;
    if (!self.demon_mincount) self.demon_mincount = BASE_DEMON_MINCOUNT;
    if (!self.demon_maxcount) self.demon_maxcount = BASE_DEMON_MAXCOUNT;
};