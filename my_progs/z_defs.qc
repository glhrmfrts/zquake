const float EV_FLOAT = 2;

// client stats
const float STAT_WAVENUM = 33;
const float STAT_CREDIT = 34;
const float STAT_CREDITDIFF = 35;
const float STAT_WAVEACTIVE = 36;

// monster types, defined to be faster than looking up classname and mod-agnostic
const float ZMONSTER_ZOMBIE = 1; // Custom zombie
const float ZMONSTER_WEAK1 = 2; // id dog
const float ZMONSTER_WEAK2 = 3; // A.D. Spider
const float ZMONSTER_MID1 = 4; // id knight
const float ZMONSTER_MID2 = 5; // A.D. Boil
const float ZMONSTER_BOSS1 = 6; // id demon
const float ZMONSTER_BOSS2 = 7; // id spawn

// base monster parameters
const float BASE_ZOMBIE_HEALTH = 30;
const float BASE_ZOMBIE_MINTIME = 5.0;
const float BASE_ZOMBIE_MAXTIME = 15.0;
const float BASE_ZOMBIE_MINCOUNT = 5;
const float BASE_ZOMBIE_MAXCOUNT = 10;
const float BASE_WEAK1_MINCOUNT = 1;
const float BASE_WEAK1_MAXCOUNT = 3;
const float BASE_WEAK2_MINCOUNT = 4;
const float BASE_WEAK2_MAXCOUNT = 12;
const float BASE_MID2_MINCOUNT = 2;
const float BASE_MID2_MAXCOUNT = 4;
const float BASE_MID1_MINCOUNT = 1;
const float BASE_MID1_MAXCOUNT = 3;
const float BASE_BOSS1_MINCOUNT = 1;
const float BASE_BOSS1_MAXCOUNT = 2;
const float BASE_BOSS2_MINCOUNT = 3;
const float BASE_BOSS2_MAXCOUNT = 5;

const float WEAK1_START_WAVE = 3;
const float WEAK2_START_WAVE = 4;
const float ZOMBIEK_START_WAVE = 5;
const float MID2_START_WAVE = 6;
const float MID1_START_WAVE = 8;
const float BOSS1_START_WAVE = 10;
const float BOSS2_START_WAVE = 15;

const float ITEM_WEAPON_SUPER_SHOTGUN = 0;
const float ITEM_WEAPON_NAILGUN = 1;
const float ITEM_WEAPON_RANDOM = 2;
const float ITEM_MEDKIT = 3;
const float ITEM_ARMOR_BASIC = 4;
const float ITEM_ARMOR_MEDIUM = 5;
const float ITEM_WEAPON_SUPER_NAILGUN = 6;
const float ITEM_SILVER_KEY = 7;
const float ITEM_GOLD_KEY = 8;

const float PRICE_WEAPON_SUPER_SHOTGUN = 90;
const float PRICE_WEAPON_NAILGUN = 100;
const float PRICE_WEAPON_SUPER_NAILGUN = 125;
const float PRICE_WEAPON_RANDOM = 80;
const float PRICE_AMMO_SHELLS = 45;
const float PRICE_AMMO_NAILS = 50;
const float PRICE_MEDKIT = 25;
const float PRICE_ARMOR_BASIC = 50;
const float PRICE_ARMOR_MEDIUM = 60;
const float PRICE_SILVER_KEY = 100;
const float PRICE_GOLD_KEY = 200;

// spawnflags for info_monster_spawn
enumflags {
    MONSTERSPAWN_NOZOMBIE,
    MONSTERSPAWN_NOWEAK1 ,
    MONSTERSPAWN_NOWEAK2 ,
    MONSTERSPAWN_NOMID1 ,
    MONSTERSPAWN_NOMID2 ,
    MONSTERSPAWN_NOBOSS1 ,
    MONSTERSPAWN_NOBOSS2 ,
};

// monsters enabled to spawn (wavemgr .monsterflags)
enumflags {
    MON_WEAK1_DOG ,
    MON_WEAK1_ENFORCER,
    MON_WEAK2_GRUNT,
    MON_WEAK2_SPIDER,
    MON_MID1_KNIGHT,
    MON_MID1_ELIMINATOR ,
    MON_MID1_FUMIGATOR,
    MON_MID1_DEFENDER ,
    MON_MID1_PYRO ,
    MON_MID2_BOIL,
    MON_MID2_GRUNT_GRENADE,
    MON_MID2_GRUNT_ROCKET,
    MON_MID2_GRUNT_PLASMA,
    MON_MID2_JIM ,
    MON_BOSS1_DEMON ,
    MON_BOSS1_FREDDIE,
    MON_BOSS2_TARBABY,
    MON_BOSS2_SEEKER,
};

// wavemgr spawnflags
const float WAVEMGR_WEAK2_AFRAID = 1;

// wave types
const float WAVE_DEFAULT = 0;
const float WAVE_BOSS = 1;
const float WAVE_ZOMBIE = 2;

const float RANDOM_WEAPON_GROUP = IT_GRENADE_LAUNCHER | IT_ROCKET_LAUNCHER | IT_LIGHTNING;

const float POWERUP_REMOVE_TIME = 60; // seconds

const float ZUMBI_MELEE_RANGE = 65;

// global variables about the current wave
float g_current_wave;
float g_monster_flags;
float g_wave_active;
float g_wave_type;
float g_boss_delay_time;
float g_zombie_health;
float g_monster_mintime;
float g_monster_maxtime;
float g_zombies_to_spawn;
float g_zombies_spawned;
float g_zombies_killed;
float g_weak1_to_spawn;
float g_weak1_spawned;
float g_weak1_killed;
float g_weak2_to_spawn;
float g_weak2_spawned;
float g_weak2_killed;
float g_mid2_to_spawn;
float g_mid2_spawned;
float g_mid2_killed;
float g_boss1_to_spawn;
float g_boss1_spawned;
float g_boss1_killed;
float g_mid1_to_spawn;
float g_mid1_spawned;
float g_mid1_killed;
float g_boss2_to_spawn;
float g_boss2_spawned;
float g_boss2_killed;
float g_monsters_to_spawn;
float g_monsters_spawned;
float g_monsters_killed;
float g_monster_killed_time;
float g_force_wave_end;

// players variables
float g_num_players;

// monster type priority
float g_prior1;
float g_prior2;
float g_cur_prior;
float g_use_prior;

// wavemgr fields
.float monsterflags;
.float monster_mintime;
.float monster_maxtime;
.float zombie_health;
.float zombie_mincount;
.float zombie_maxcount;
.float weak1_mincount;
.float weak1_maxcount;
.float weak2_mincount;
.float weak2_maxcount;
.float mid2_mincount;
.float mid2_maxcount;
.float mid1_mincount;
.float mid1_maxcount;
.float boss1_mincount;
.float boss1_maxcount;
.float boss2_mincount;
.float boss2_maxcount;

// monster fields
.float zmonster; // flag to indicate this is a z-monster
.float zmonstertype; // specific z-monster type

void(float num, float type, .__variant fld) clientstat = #232;

void(entity ent, float value) GiveCredits;

void(vector org) SpawnPowerup;

void() EndWaveCheat;