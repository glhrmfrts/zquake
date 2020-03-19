entity g_last_zombie;

.float radius;

void() ms_think;

void() ms_set_next_think =
{
    local float min = g_monster_mintime + self.delay;
    local float max = g_monster_maxtime + self.delay;
    local float next_time = min + (random() * (max - min));
    self.nextthink = time + next_time;

    bprint (ftos(next_time));
    bprint("\n");
};

void() ms_use_last_enemy =
{
    if (self.enemy != world)
    {
        local entity this = self;
        activator = find(world, classname, "player");
        self = self.enemy;
        //monster_use();
        self = this;
        activator = world;
    }

    self.enemy = world;
    self.think = ms_think;
    ms_set_next_think();
};

vector(float rad) MonsterSpawnOffset =
{
    float offsx = random() * rad;
    float offsy = random() * rad;
    return [offsx, offsy, 0];
};

void(entity mon, float pupchance, float defcredit, float sgcredit, float axecredit) SetupSpawnedMonster =
{
    mon.spawnflags = MON_SPAWN_ANGRY;
    mon.zmonster = TRUE;
    mon.wavenum = pupchance;
    mon.credit = defcredit;
    mon.creditdiff = sgcredit;
    mon.creditdifftime = axecredit;
};

void(vector org) SpawnZombie =
{
    local float r = random();

    // Spawn new empty entity to become zombie
    local entity zomb = spawn();
    zomb.origin = org;
    SetupSpawnedMonster(zomb, 0.03, 2, 3, 5);

    // Call monster_zombie to setup zombie entity
    local entity this = self;
    self = zomb;
    if (r <= 0.2 && g_current_wave >= ZOMBIEK_START_WAVE && g_wave_type != WAVE_ZOMBIE)
    {
        zomb.classname = "monster_zumbik";
        zomb.zmonstertype = ZMONSTER_ZOMBIE;
        monster_zumbik();
    }
    else
    {
        zomb.classname = "monster_zumbi";
        zomb.zmonstertype = ZMONSTER_ZOMBIE;
        monster_zumbi();
    }
    self = this;

    g_zombies_spawned = g_zombies_spawned + 1;
    self.enemy = zomb;

    bprint("Spawned Zombie!\n");
};

void(vector org) SpawnWeak1 =
{
    // Spawn new empty entity to become dog
    local entity dog = spawn();
    dog.classname = "monster_dog";
    dog.origin = org;
    dog.zmonstertype = ZMONSTER_WEAK1;
    SetupSpawnedMonster(dog, 0.01, 1, 2, 3);

    local entity this = self;
    self = dog;
    monster_dog();
    self = this;

    g_weak1_spawned = g_weak1_spawned + 1;
    self.enemy = dog;
    bprint("Spawned Dog!\n");
};

void(vector org) SpawnWeak2 =
{
    local entity spider = spawn();
    spider.classname = "monster_spider";
    spider.origin = org;
    spider.zmonstertype = ZMONSTER_WEAK2;
    SetupSpawnedMonster(spider, 0.01, 1, 2, 3);

    local entity this = self;
    self = spider;
    monster_spider();
    self = this;

    g_weak2_spawned = g_weak2_spawned + 1;
    self.enemy = spider;
    bprint("Spawned Spider!\n");
};

void(vector org) SpawnMid1 =
{
    local entity kni = spawn();
    kni.classname = "monster_knight";
    kni.origin = org;
    kni.zmonstertype = ZMONSTER_MID1;
    SetupSpawnedMonster(kni, 0.03, 2, 3, 5);

    local entity this = self;
    self = kni;
    monster_knight();
    self = this;

    g_mid1_spawned = g_mid1_spawned + 1;
    self.enemy = kni;
    bprint("Spawned Knight!\n");
};

void(vector org) SpawnMid2 =
{
    local entity mon = spawn();
    mon.classname = "monster_boil";
    mon.origin = org;
    mon.zmonstertype = ZMONSTER_MID2;
    if (random() < 0.2)
        mon.poisonous = TRUE;

    SetupSpawnedMonster(mon, 0.03, 2, 3, 5);

    local entity this = self;
    self = mon;
    monster_boil();
    self = this;

    g_mid2_spawned = g_mid2_spawned + 1;
    self.enemy = mon;
    bprint("Spawned Boil!\n");
};

void(vector org) SpawnBoss1 =
{
    // Spawn new empty entity to become demon
    local entity de = spawn();
    de.classname = "monster_demon1";
    de.origin = org;
    de.zmonstertype = ZMONSTER_BOSS1;
    SetupSpawnedMonster(de, 0.07, 10, 15, 20);

    local entity this = self;
    self = de;
    monster_demon1();
    self = this;

    g_boss1_spawned = g_boss1_spawned + 1;
    self.enemy = de;
    bprint("Spawned Demon!\n");
};

void(vector org) SpawnBoss2 =
{
    // Spawn new empty entity to become demon
    local entity de = spawn();
    de.classname = "monster_tarbaby";
    de.origin = org;
    de.zmonstertype = ZMONSTER_BOSS2;
    SetupSpawnedMonster(de, 0.05, 7, 12, 15);

    local entity this = self;
    self = de;
    monster_tarbaby();
    self = this;

    g_boss2_spawned = g_boss2_spawned + 1;
    self.enemy = de;
    bprint("Spawned Tarbaby!\n");
};

float() ShouldSpawnWeakAnyway =
{
    // More chance to spawn dog if we're at the beginning of the wave
    local float prog = g_monsters_killed / g_monsters_to_spawn;
    if (prog < 0.3 && (random() > 0.75))
        return TRUE;

    return FALSE;
};

float() ShouldSpawnMidAnyway =
{
    // More chance to spawn boil if we're at the middle of the wave
    local float prog = g_monsters_killed / g_monsters_to_spawn;
    if (prog > 0.2 && prog < 0.8 && (random() > 0.75))
        return TRUE;

    return FALSE;
};

float() ShouldSpawnBossAnyway =
{
    // Most certainly spawn demon if we're at the end of the wave
    local float prog = g_monsters_killed / g_monsters_to_spawn;
    if (g_monsters_killed / g_monsters_to_spawn > 0.9)
        return TRUE;

    return FALSE;
};

float(entity ms) CalcExtraWeak2 =
{
    if (g_wave_type == WAVE_BOSS) return 0;

    // Use the spider_mincount field as extra for a specific monster spawn
    return floor(ms.weak2_mincount * g_current_wave);
};

float g_prior_killed;
float g_prior_to_spawn;

float() GetNextMonsterSpawnChance =
{
    if (g_use_prior)
    {
        local float prior = g_prior1;
        if (g_cur_prior == 1)
            prior = g_prior2;

        // Return chance based on priority
        if (prior == ZMONSTER_BOSS1)
        {
            g_prior_killed = g_boss1_killed;
            g_prior_to_spawn = g_boss1_to_spawn;
            return 1.0;
        }
        else if (prior == ZMONSTER_BOSS2)
        {
            g_prior_killed = g_boss2_killed;
            g_prior_to_spawn = g_boss2_to_spawn;
            return 0.71;
        }
    }
    return random();
};

void() ms_think =
{
    // If the wave is not active or this monster spawn is disabled, skip
    if (!g_wave_active || !self.state) { self.nextthink = time + 0.1; return; }
    if (g_wave_type == WAVE_BOSS && time < g_boss_delay_time) { self.nextthink = time + 0.1; return; }

    // If all the monsters that should spawn are already spawned, skip
    if (g_monsters_spawned >= g_monsters_to_spawn) { self.nextthink = time + 0.1; return; }

    local float spawned = FALSE;
    local float tries = 0;
    while (!spawned)
    {
        local float zomb_enabled = !(self.spawnflags & MONSTERSPAWN_NOZOMBIE);
        local float weak1_enabled = !(self.spawnflags & MONSTERSPAWN_NOWEAK1);
        local float weak2_enabled = !(self.spawnflags & MONSTERSPAWN_NOWEAK2);
        local float mid1_enabled = !(self.spawnflags & MONSTERSPAWN_NOMID1);
        local float mid2_enabled = !(self.spawnflags & MONSTERSPAWN_NOMID2);
        local float boss1_enabled = !(self.spawnflags & MONSTERSPAWN_NOBOSS1);
        local float boss2_enabled = !(self.spawnflags & MONSTERSPAWN_NOBOSS2);
        
        local vector neworigin = self.origin + MonsterSpawnOffset(self.radius);
        if (entity_pcontent(neworigin)) continue; // try again

        local float rchance = GetNextMonsterSpawnChance();
        if (boss1_enabled && (rchance > 0.97 || ShouldSpawnBossAnyway()))
        {
            // Spawn demon by 3% chance or if 90% of other enemies were killed
            if (g_boss1_spawned < g_boss1_to_spawn)
            {
                SpawnBoss1(neworigin);
                spawned = TRUE;
            }
        }
        else if ((weak1_enabled || weak2_enabled) && (rchance > 0.9 || ShouldSpawnWeakAnyway()))
        {
            local float r = random();
            if (weak1_enabled && r > 0.5 && g_weak1_spawned < g_weak1_to_spawn)
            {
                SpawnWeak1(neworigin);
                spawned = TRUE;
            }
            else if (weak2_enabled && g_weak2_spawned < (g_weak2_to_spawn + CalcExtraWeak2(self)))
            {
                SpawnWeak2(neworigin);
                spawned = TRUE;
            }
        }
        else if (mid1_enabled && (rchance > 0.83 || ShouldSpawnMidAnyway()))
        {
            if (g_mid1_spawned < g_mid1_to_spawn)
            {
                SpawnMid1(neworigin);
                spawned = TRUE;
            }
        }
        else if (mid2_enabled && (rchance > 0.75 || ShouldSpawnMidAnyway()))
        {
            if (g_mid2_spawned < g_mid2_to_spawn)
            {
                SpawnMid2(neworigin);
                spawned = TRUE;
            }
        }
        else if (boss2_enabled && (rchance > 0.70))
        {
            if (g_boss2_spawned < g_boss2_to_spawn)
            {
                SpawnBoss2(neworigin);
                spawned = TRUE;
            }
        }
        else if (zomb_enabled)
        {
            if (g_zombies_spawned < g_zombies_to_spawn)
            {
                SpawnZombie(neworigin);
                spawned = TRUE;
            }
        }

        // Try to spawn up to 20 times, otherwise give up so we do not impact FPS
        if (tries >= 20) break;
        tries = tries + 1;
    }

    if (spawned)
    {
        g_monsters_spawned = g_monsters_spawned + 1;
        // TODO: bug?
        // monster_update_total(0.5);
    }

    // Check and advance priority variables
    if (g_prior_killed >= (g_prior_to_spawn - RandomBetween(1.0, 2.0)))
    {
        g_cur_prior = g_cur_prior + 1;
    }

    self.think = ms_use_last_enemy;
    self.nextthink = time + 0.1;
};

/*
==============
ms_use

Enable the monster spawn
==============
*/
void() ms_use =
{
    if (self.state) return;

    self.state = 1;
    self.think = ms_think;
    ms_set_next_think();
};

/*QUAKED info_monster_spawn (0 0.5 0.8) (-8 -8 -8) (8 8 8) NOZOMBIE NODOG NOKNIGHT NODEMON NOSPIDER
A monster spawner
*/
void() info_monster_spawn =
{
    self.solid = SOLID_NOT;
    self.movetype = MOVETYPE_NONE;
    self.think = ms_think;
    self.use = ms_use;
    self.state = 1;
    if (self.targetname)
        self.state = 0;

    setmodel(self, "");
    setsize(self, '0 0 0', '0 0 0');

    if (!self.radius) self.radius = 50;
    if (!self.state) return;

    ms_set_next_think();
};
