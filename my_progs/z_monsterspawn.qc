entity g_last_zombie;

.float radius;

void() ms_think;

void() ms_set_next_think =
{
    local float min = g_monster_mintime;
    local float max = g_monster_maxtime;
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

void(entity mon) SetupSpawnedMonster =
{
    mon.spawnflags = MON_SPAWN_ANGRY;
    mon.zmonster = TRUE;
};

void(vector org) SpawnZombie =
{
    local float r = random();

    // Spawn new empty entity to become zombie
    local entity zomb = spawn();
    zomb.origin = org;
    SetupSpawnedMonster(zomb);

    // Call monster_zombie to setup zombie entity
    local entity this = self;
    self = zomb;
    if (r <= 0.2 && g_current_wave >= ZOMBIEK_START_WAVE)
    {
        zomb.classname = "monster_zumbik";
        zomb.zmonstertype = ZMONSTER_ZUMBIK;
        monster_zumbik();
    }
    else
    {
        zomb.classname = "monster_zumbi";
        zomb.zmonstertype = ZMONSTER_ZUMBI;
        monster_zumbi();
    }
    self = this;

    g_zombies_spawned = g_zombies_spawned + 1;
    self.enemy = zomb;

    bprint("Spawned Zombie!\n");
};

void(vector org) SpawnDog =
{
    // Spawn new empty entity to become dog
    local entity dog = spawn();
    dog.classname = "monster_dog";
    dog.origin = org;
    dog.zmonstertype = ZMONSTER_DOG;
    SetupSpawnedMonster(dog);

    local entity this = self;
    self = dog;
    monster_dog();
    self = this;

    g_dogs_spawned = g_dogs_spawned + 1;
    self.enemy = dog;
    bprint("Spawned Dog!\n");
};

void(vector org) SpawnSpider =
{
    local entity spider = spawn();
    spider.classname = "monster_spider";
    spider.origin = org;
    spider.zmonstertype = ZMONSTER_SPIDER;
    SetupSpawnedMonster(spider);

    local entity this = self;
    self = spider;
    monster_spider();
    self = this;

    g_spiders_spawned = g_spiders_spawned + 1;
    self.enemy = spider;
    bprint("Spawned Spider!\n");
};

void(vector org) SpawnBoil =
{
    local entity mon = spawn();
    mon.classname = "monster_boil";
    mon.origin = org;
    mon.zmonstertype = ZMONSTER_BOIL;
    if (random() < 0.2)
        mon.poisonous = TRUE;

    SetupSpawnedMonster(mon);

    local entity this = self;
    self = mon;
    monster_boil();
    self = this;

    g_boils_spawned = g_boils_spawned + 1;
    self.enemy = mon;
    bprint("Spawned Boil!\n");
};

void(vector org) SpawnKnight =
{
    local entity kni = spawn();
    kni.classname = "monster_knight";
    kni.origin = org;
    kni.zmonstertype = ZMONSTER_KNIGHT;
    SetupSpawnedMonster(kni);

    local entity this = self;
    self = kni;
    monster_knight();
    self = this;

    g_knights_spawned = g_knights_spawned + 1;
    self.enemy = kni;
    bprint("Spawned Knight!\n");
};

void(vector org) SpawnDemon =
{
    // Spawn new empty entity to become demon
    local entity de = spawn();
    de.classname = "monster_demon1";
    de.origin = org;
    de.zmonstertype = ZMONSTER_DEMON;
    SetupSpawnedMonster(de);

    local entity this = self;
    self = de;
    monster_demon1();
    self = this;

    g_demons_spawned = g_demons_spawned + 1;
    self.enemy = de;
    bprint("Spawned Demon!\n");
};

float() ShouldSpawnDogOrSpiderAnyway =
{
    // More chance to spawn dog if we're at the beginning of the wave
    local float prog = g_monsters_killed / g_monsters_to_spawn;
    if (prog < 0.3 && (random() > 0.75))
        return TRUE;
        
    return FALSE;
};

float() ShouldSpawnBoilAnyway =
{
    // More chance to spawn boil if we're at the middle of the wave
    local float prog = g_monsters_killed / g_monsters_to_spawn;
    if (prog > 0.2 && prog < 0.8 && (random() > 0.75))
        return TRUE;
        
    return FALSE;
};

float() ShouldSpawnKnightAnyway =
{
    // More chance to spawn knight if we're at the middle of the wave
    local float prog = g_monsters_killed / g_monsters_to_spawn;
    if (prog > 0.2 && prog < 0.8 && (random() > 0.75))
        return TRUE;
        
    return FALSE;
};

float() ShouldSpawnDemonAnyway =
{
    // Most certainly spawn demon if we're at the end of the wave
    local float prog = g_monsters_killed / g_monsters_to_spawn;
    if (g_monsters_killed / g_monsters_to_spawn > 0.9)
        return TRUE;

    return FALSE;
};

float(entity ms) CalcExtraSpiders =
{
    if (g_wave_type == WAVE_BOSS) return 0;

    // Use the spider_mincount field as extra for a specific monster spawn
    return floor(ms.spider_mincount * g_current_wave);
};

void() ms_think =
{
    // If the wave is not active or this monster spawn is disabled, skip
    if (!g_wave_active || !self.state) { self.nextthink = time + 0.1; return; }
    if (g_wave_type == WAVE_BOSS && time < g_boss_delay_time) { self.nextthink = time + 0.1; return; }

    // If all the monsters that should spawn are already spawned, skip
    if (g_zombies_spawned >= g_zombies_to_spawn &&
        g_dogs_spawned >= g_dogs_to_spawn &&
        g_spiders_spawned >= g_spiders_to_spawn &&
        g_boils_spawned >= g_boils_to_spawn &&
        g_knights_spawned >= g_knights_to_spawn &&
        g_demons_spawned >= g_demons_to_spawn)
    { 
        self.nextthink = time + 0.1;
        return;
    }

    local float spawned = FALSE;
    local float tries = 0;
    while (!spawned)
    {
        local float demon_enabled = !(self.spawnflags & MONSTERSPAWN_NODEMON);
        local float dog_enabled = !(self.spawnflags & MONSTERSPAWN_NODOG);
        local float kni_enabled = !(self.spawnflags & MONSTERSPAWN_NOKNIGHT);
        local float zomb_enabled = !(self.spawnflags & MONSTERSPAWN_NOZOMBIE);
        local float spi_enabled = !(self.spawnflags & MONSTERSPAWN_NOSPIDER);
        local float boil_enabled = !(self.spawnflags & MONSTERSPAWN_NOBOIL);
        local vector neworigin = self.origin + MonsterSpawnOffset(self.radius);
        if (entity_pcontent(neworigin)) continue; // try again

        local float rchance = random();
        if (demon_enabled && (rchance > 0.97 || ShouldSpawnDemonAnyway()))
        {
            // Spawn demon by 3% chance or if 90% of other enemies were killed
            if (g_demons_spawned < g_demons_to_spawn)
            {
                SpawnDemon(neworigin);
                spawned = TRUE;
            }
        }
        else if ((dog_enabled || spi_enabled) && (rchance > 0.9 || ShouldSpawnDogOrSpiderAnyway()))
        {
            local float r = random();
            if (dog_enabled && r > 0.5 && g_dogs_spawned < g_dogs_to_spawn)
            {
                SpawnDog(neworigin);
                spawned = TRUE;
            }
            else if (spi_enabled && g_spiders_spawned < (g_spiders_to_spawn + CalcExtraSpiders(self)))
            {
                SpawnSpider(neworigin);
                spawned = TRUE;
            }
        }
        else if (kni_enabled && (rchance > 0.83 || ShouldSpawnKnightAnyway()))
        {
            if (g_knights_spawned < g_knights_to_spawn)
            {
                SpawnKnight(neworigin);
                spawned = TRUE;
            }
        }
        else if (boil_enabled && (rchance > 0.75 || ShouldSpawnBoilAnyway()))
        {
            if (g_boils_spawned < g_boils_to_spawn)
            {
                SpawnBoil(neworigin);
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

	if (self.delay != 0.0)
    {
		self.nextthink = time + self.delay;
	}
	else
    {
		ms_set_next_think();
	}
};
